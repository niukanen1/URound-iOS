//
//  ContentView.swift
//  URound-iOS
//
//  Created by Ivan Niukanen on 13.04.2022.
//

import SwiftUI


struct MainApp: View {
//    @EnvironmentObject var appState: AppState
//    @EnvironmentObject var userData: UserData
//    @EnvironmentObject var loaderInfo: LoaderModel
//    @EnvironmentObject var errorBannerInfo: ErrorBannerModel;
    
    @StateObject var Network = NetworkReachability();
    @State private var showingAlert: Bool = false;
    var body: some View {
        ZStack {
            Navigation()
        }
    }
}

//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
