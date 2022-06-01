//
//  QueryExecutor.swift
//  URound-iOS
//
//  Created by Ivan Niukanen on 04.05.2022.
//

import Foundation
import SwiftUI
import Apollo



class QueryResponse: ObservableObject {
    init() {
        isError = false
        ErrorDescription = ""
    }
    @Published var isError: Bool
    @Published var ErrorDescription: String
}

enum queryType {
    case login, register
}
struct QueryExecutor {
    @ObservedObject var loaderInfo: LoaderModel
    @ObservedObject var userData: UserData
    @ObservedObject var errorBannerInfo: ErrorBannerModel

    @ObservedObject var data = QueryResponse()
    
    
    // POSTS DATA
    @EnvironmentObject var postsData: PostsData ;
    
    private func update (showError: Bool, description: String) {
        self.data.isError.toggle();
        self.data.ErrorDescription = description;
    }
    
    
    func LoginUser(username: String, password: String) {
        loaderInfo.isLoading = true
        Network.shared.apollo.fetch(query: LoginQuery(username: username, password: password)) { result in
            switch result {
            case .success(let res):
                guard let data = res.data else {return}
                
                if data.login.isLoggedIn && !data.login.message.isError {
                    userData.setIsLogged(newValue: true)
                    userData.updateKeychain(username: username, password: password)
                    print("LoginUser")
                } else {
                    errorBannerInfo.Show(Message: "Wrong username or pass" )
                }
            case .failure(let error):
                errorBannerInfo.Show(Message: error.localizedDescription)
            }
            loaderInfo.isLoading = false
        }
        
        
        
    }
    
    func RegisterUser(userInput: UserInput) {
        loaderInfo.isLoading = true;
        Network.shared.apollo.perform(mutation: AddUserMutation(user: userInput)) { result in
            switch result {
            case .success(let res):
                guard let data = res.data else { return }
                if data.addUser.message.isError {
                    errorBannerInfo.Show(Message: data.addUser.message.description!)
                } else {
                    userData.setIsLogged(newValue: true)
                    userData.updateKeychain(username: userInput.username, password: userInput.password);
                    print("register user")
                }
            case .failure(let error):
                errorBannerInfo.Show(Message: error.localizedDescription)
            }
            loaderInfo.isLoading = false
        }
        
    }
}
