//
//  Progress.swift
//  URound-iOS
//
//  Created by Ivan Niukanen on 30.04.2022.
//

import SwiftUI


struct LoaderView: View {
    @Environment(\.colorScheme) var colorScheme;
    @EnvironmentObject var loader: LoaderModel
    var CornerRadius: CGFloat = 10
//    @Binding var isLoading: Bool
    
    var body: some View {
        if loader.isLoading {
            ProgressView {
                Text("Loading")
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: CornerRadius)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .background(colorScheme == .dark ? Color.init(red: 0.1, green: 0.1, blue: 0.1) : Color.init(white: 0.98))
            .cornerRadius(CornerRadius)
        }
    }
}
