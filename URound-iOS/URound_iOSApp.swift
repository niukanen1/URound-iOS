//
//  URound_iOSApp.swift
//  URound-iOS
//
//  Created by Ivan Niukanen on 13.04.2022.

import SwiftUI

@main
struct URound_iOSApp: App {
    @StateObject var userData = UserData();
    @StateObject var loader = LoaderModel();
    @StateObject var ErrorBanner = ErrorBannerModel();
    
    
    @State private var isSplash = true;
    @State private var isEnded  = false;
    
    @State private var isInSystem = false
    
    @StateObject var networkReachability: NetworkReachability = NetworkReachability();
    var body: some Scene {
        WindowGroup {
//            ZStack {
//                if networkReachability.isConnected || isEnded {
//                    if userData.isLoggedIn && isEnded {
//                        MainApp()
//                            .ignoresSafeArea(.keyboard)
//                            .environmentObject(ErrorBanner)
//                            .environmentObject(loader)
//                            .environmentObject(userData)
//
//                    } else if isEnded {
//                        LogReg()
//                            .environmentObject(ErrorBanner)
//                            .environmentObject(loader)
//                            .environmentObject(userData)
//                    }
//                    LoaderView().environmentObject(loader)
//                    if isSplash {
//                        Splash_Screen(isEnded: $isEnded, isSplash: $isSplash)
//                            .environmentObject(userData)
//                            .environmentObject(ErrorBanner)
//                    }
//                } else {
//                    NoConnectionScreen(retryFunc: tryToLoginUser);
//                }
//
//
//            }.ignoresSafeArea(.all)
            PostView(post: Post(_id: "some", categories: ["asd"], title: "asdfa", shortText: "asda", fullText: "ad", images: ["https://s.err.ee/photo/crop/2020/04/29/774536h663at4.jpg"], videos: ["asda"], date: "asd", owner: PostOwner(username: "asdad"), href: "asdasd"))
        }
    }
    
    func tryToLoginUser() {
        guard let username = userData.getFromKeychain()?.username else { return }
        guard let password = userData.getFromKeychain()?.password else { return }
        //        print("\(username) \(password)")
        if username != "none" && password != "none" {
            Network.shared.apollo.fetch(query: LoginQuery(username: username, password: password)) { result in
                switch result {
                case .success(let res):
                    guard let data = res.data else {return}
                    
                    if data.login.isLoggedIn && !data.login.message.isError {
                        DispatchQueue.main.async {
                            userData.setIsLogged(newValue: true)
                            userData.updateKeychain(username: username, password: password)
                            isEnded = true
                        }
                        print("LoginUser")
                    } else {
                        print("2 fail")
                        //                        errorBannerInfo.Show(Message: "Wrong username or pass" )
                        isEnded = true
                    }
                case .failure(_):
                    //                    errorBannerInfo.Show(Message: error.localizedDescription)
                    print("1 fail")
                }
                
            }
        }
    }
}
