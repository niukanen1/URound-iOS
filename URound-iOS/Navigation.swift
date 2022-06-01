//
//  Navigation.swift
//  URound-iOS
//
//  Created by Ivan Niukanen on 17.04.2022.

import SwiftUI

struct Navigation: View {
    @StateObject var postsData = PostsData();
    var body: some View {
        TabView {
            HomeView()
                .tabItem {Label("Home", systemImage: "house")}.tag(1)
                .environmentObject(postsData)
            Text("Map").tabItem { Label("Map", systemImage: "map")}.tag(2)
            Text("Chat").tabItem { Label("Chat", systemImage: "message")}
            ProfileView().tabItem { Label("Profile", systemImage: "person")}
        }
    }
}

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}
