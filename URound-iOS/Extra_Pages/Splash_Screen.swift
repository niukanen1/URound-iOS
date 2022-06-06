//
//  Splash_Screen.swift
//  URound-iOS
//
//  Created by Ivan Niukanen on 23.05.2022.
//

import SwiftUI

struct Splash_Screen: View {
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var ErrorBanner: ErrorBannerModel
    
    @Binding var isEnded: Bool;
    @Binding var isSplash: Bool;
    
    @State private var isAnimating = true;
    var body: some View {
        ZStack {
            ZStack {
                Image("Background_gradient")
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                
                VStack {
                    Image("Launch_logo")
                        .scaleEffect(isAnimating ? 4 : 1)
                }
                .ignoresSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                
            }
        }.ignoresSafeArea(.all)
            .onAppear {
                withAnimation(.easeIn) {
                    isAnimating.toggle()
                }
                autoLoginUser()
            }
    }
    func EndSplashScreen() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeIn(duration: 0.2)) {
                self.isSplash = false;
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation {
                    self.isEnded = true
                }
                
            }
        }
    }
    func autoLoginUser() {
        guard let username = userData.getFromKeychain()?.username else { EndSplashScreen(); return }
        guard let password = userData.getFromKeychain()?.password else { EndSplashScreen(); return }
        print("\(username) \(password)")
        if username != "none" && password != "none" {
            Network.shared.apollo.fetch(query: LoginQuery(username: username, password: password)) { result in
                switch result {
                case .success(let res):
                    guard let data = res.data else {return}
                    
                    if data.login.isLoggedIn && !data.login.message.isError {
                        DispatchQueue.main.async {
                            userData.setIsLogged(newValue: true)
                            userData.updateKeychain(username: username, password: password)
                        }
                        print("LoginUser")
                    } else {
                        print("fail")
                        ErrorBanner.Show(Message: "Wrong username or pass" )
                    }
                    EndSplashScreen()
                case .failure(let error):
                    EndSplashScreen()
                    ErrorBanner.Show(Message: error.localizedDescription)
                    print("fail")
                }
            }
        }
        print("Splash all false")
    }
}

struct Splash_Screen_Previews: PreviewProvider {
    static var previews: some View {
        Splash_Screen(isEnded: .constant(true), isSplash: .constant(true))
            .environmentObject(UserData())
    }
}
