//
//  UserFetching.swift
//  URound-iOS
//
//  Created by Ivan Niukanen on 15.04.2022.
//

import SwiftUI

struct UserFetching: View {
    @State private var users: [GetAllUsersQuery.Data.GetAllUser] = [];
    @State private var fetchFailed: Bool = false
    @ObservedObject var network = NetworkReachability();
    
    func fetchUsers() -> Void {
        Network.shared.apollo.fetch(query: GetAllUsersQuery()) { (result) in
            switch result {
            case .success( let res ):
                if let resultData = res.data?.getAllUsers {
                    self.users.append(contentsOf: resultData);
                    self.fetchFailed = false
                }
            case .failure(let err):
                self.fetchFailed = true;
                print("Something went WRONG!!!");
                print(err._code)
            }
        }
    }
    var body: some View {
        VStack {
            Text(network.isConnected ? "Connected" : "No connection..." )
            if fetchFailed {
                Text("Fetching failed, please try again...")
                Button("Retry") {
                    fetchUsers();
                }
            }
            List {
                ForEach(users, id: \._id) { user in
                    Text(user.email);
                }
            }
            
            
        }.onAppear {
            fetchUsers();
        }
    }
}

struct UserFetching_Previews: PreviewProvider {
    static var previews: some View {
        UserFetching()
    }
}
