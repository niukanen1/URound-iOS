//
//  Home.swift
//  URound-iOS
//
//  Created by Ivan Niukanen on 18.04.2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var loader: LoaderModel
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var ErrorBanner: ErrorBannerModel
    
    var body: some View {
        AllPostsView();
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
