//
//  PostModel.swift
//  URound-iOS
//
//  Created by Ivan Niukanen on 01.06.2022.
//

import Foundation
import UIKit


class PostModel: ObservableObject {
    init(image: UIImage? = nil) {
        self.image = image;
    }
    @Published var image: UIImage?
}
