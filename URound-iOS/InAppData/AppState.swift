//
//  AppState.swift
//  URound-iOS
//
//  Created by Ivan Niukanen on 06.05.2022.
//

import Foundation


class AppState: ObservableObject {
    @Published var userData = UserData();
    @Published var ErrorBanner = ErrorBannerModel();
    @Published var loader = LoaderModel();
}
