//
//  Apollo.swift
//  URound-iOS
//
//  Created by Ivan Niukanen on 13.04.2022.
//

import Foundation
import Apollo

class Network {
    static let shared = Network();
    private init() {}
    lazy var apollo = ApolloClient(url: URL(string: "https://uround-server.herokuapp.com")!)
}
