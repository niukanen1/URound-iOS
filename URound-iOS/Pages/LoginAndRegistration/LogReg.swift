//
//  LogReg.swift
//  URound-iOS
//
//  Created by Ivan Niukanen on 21.04.2022.
//

import SwiftUI

struct LogReg: View {
    @EnvironmentObject var userData: UserData
    @State var isLoginScreen: Bool = true;
    var body: some View {
        //        ZStack {
        GeometryReader { _ in
            ZStack {
                VStack {
                    if isLoginScreen {
                        Login()
                            .transition(.scale)
                    } else {
                        Registration()
                    }
                }
                VStack {
                    Spacer()
                    if isLoginScreen {
                        Text("Don't have an account yet?")
                            .font(.callout)
                            .fontWeight(.light)
                        Button("Register") {
                            self.isLoginScreen = false
                        }
                    } else {
                        Text("Already have an account?")
                            .fontWeight(.light)
                        Button("Log in") {
                            self.isLoginScreen = true
                        }
                    }
                }
                .padding(.bottom, 100)
            }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }
        
        .errorBanner()
    }
}

struct LogReg_Previews: PreviewProvider {
    static var previews: some View {
        LogReg()
    }
}
