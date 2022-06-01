//
//  UserData.swift
//  URound-iOS
//
//  Created by Ivan Niukanen on 15.04.2022.
//

import Foundation
import KeychainAccess
import SwiftUI


class UserData: ObservableObject {
    private let my_keychain: Keychain
    private let SERVICE_NAME = "com.uround";
    private let USERNAME_KEY = "username";
    private let PASSWORD_KEY = "password"
    @Published var isLoggedIn: Bool = false;
    
    init() {
        self.my_keychain = Keychain(service: self.SERVICE_NAME);
        guard let username = getFromKeychain()?.username else { return }
        guard let password = getFromKeychain()?.password else { return }
        if username == "none" || password == "none" {
            do {
                try self.my_keychain.set("n", key: self.USERNAME_KEY);
                try self.my_keychain.set("n", key: self.PASSWORD_KEY);
            } catch let err {
                print("Something went wrong during UserData initialisation \(err)");
            }
        }
    }
    
    func setIsLogged(newValue: Bool) {
        withAnimation {
            self.isLoggedIn = newValue
        }
    }
    
    func updateKeychain(username: String, password: String) {
        do {
            try self.my_keychain.set(username, key: self.USERNAME_KEY);
            try self.my_keychain.set(password, key: self.PASSWORD_KEY);
        } catch let err {
            print("Error updating pass or username \(err)")
        }
    }
    func getFromKeychain() -> (username: String, password: String)? {
        do {
            guard let gotten_username = try self.my_keychain.get(USERNAME_KEY) else {return nil}
            guard let gotten_password = try self.my_keychain.get(PASSWORD_KEY) else {return nil}
            return (gotten_username, gotten_password)
        } catch let err {
            print(err)
            return nil
        }
    }
    
}
