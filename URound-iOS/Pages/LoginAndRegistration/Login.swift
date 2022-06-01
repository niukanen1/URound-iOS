//
//  Login.swift
//  URound-iOS
//
//  Created by Ivan Niukanen on 18.04.2022.
//

import SwiftUI



struct Login: View {
    @EnvironmentObject var loader: LoaderModel
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var ErrorBanner: ErrorBannerModel
    @ObservedObject    var queryResponse = QueryResponse();
    
    var queryExecutor: QueryExecutor {
        return QueryExecutor(loaderInfo: loader, userData: userData, errorBannerInfo: ErrorBanner)
    }
    
    @EnvironmentObject var errorBannerInfo: ErrorBannerModel;
    
    
    @State private var username = "";
    @State private var password = "";
    
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    TextField(text: $username) {
                        Text("Username")
                    }
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                }
                
                VStack {
                    SecureField(text: $password) {
                        Text("Password")
                    }
                }
                Button(action: LoginHandler) {
                    Text("Login")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                }
                .padding(15)
                .padding(.horizontal)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(20)
                .padding(.top, 40)
            }
            .ignoresSafeArea(.keyboard)
            .padding(.horizontal, 50)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
    
    func LoginHandler() {
        if username.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 && password.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 {
            
            //            loader.isLoading = true;
            queryExecutor.LoginUser(username: username, password: password)
        } else {
            print("NO FIELDS")
            errorBannerInfo.Show(Message: "Fields are empty")
        }
    }
    
}

//struct Login_Previews: PreviewProvider {
//    static var previews: some View {
//        Login()
//    }
//}
