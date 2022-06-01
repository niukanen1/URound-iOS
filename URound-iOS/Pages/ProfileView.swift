//
//  ProfileView.swift
//  URound-iOS
//
//  Created by Ivan Niukanen on 04.05.2022.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userData: UserData
    var usernameAndPass: (username: String, password: String)? {
        if let res = userData.getFromKeychain() {
            return (res.username, res.password)
        } else { return nil}
    }
    var body: some View {
        VStack {
            Text(usernameAndPass?.username ?? "None")
            Text(String(repeating: "*", count: (usernameAndPass?.password ?? "None").count))
            Button("Log out") {
                userData.isLoggedIn = false;
                userData.updateKeychain(username: "none", password: "none")
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
