//
//  ErrorBanner.swift
//  URound-iOS
//
//  Created by Ivan Niukanen on 06.05.2022.
//

import Foundation
import SwiftUI 

class ErrorBannerModel: ObservableObject {
    init() {
        self.isShowing = false
        self.text = ""
    }
    @Published var isShowing: Bool
    @Published var text: String
    
    func Show(Message newText: String) {
        print("SHOWING")
        if self.isShowing && newText != self.text {
            withAnimation {
                self.isShowing = false;
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation {
                    self.text = newText;
                    self.isShowing = true;
                }
            }
        } else {
            //            print("ELSE");
            self.text = newText;
            withAnimation {
                self.isShowing = true;
            }
            //            print(self.isShowing)
        }
    }
}

