//
//  ErrorMessage.swift
//  URound-iOS
//
//  Created by Ivan Niukanen on 18.04.2022.
//

import SwiftUI

struct ErrorMessage: View {
    @Binding var message: String;
    @Binding var isShowing: Bool;
    
    var body: some View {
        VStack {
            if isShowing {
                Text(message)
                    .foregroundColor(.red)
            }
        }
    }
}

//struct ErrorMessage_Previews: PreviewProvider {
//    static var previews: some View {
//        ErrorMessage()
//    }
//}
