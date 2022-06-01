//
//  LoaderModel.swift
//  URound-iOS
//
//  Created by Ivan Niukanen on 09.05.2022.
//

import Foundation
import SwiftUI


class LoaderModel: ObservableObject {
    @Published var isLoading: Bool = false;
}
