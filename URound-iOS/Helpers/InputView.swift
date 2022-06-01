//
//  InputView.swift
//  URound-iOS
//
//  Created by Ivan Niukanen on 16.05.2022.
//

import SwiftUI


enum inputType {
    case clean, secure, ordinary
}


struct InputView: View {
    
    @Binding var text: String;
    let type: inputType
    var placeHolder: String = "";
    
    var body: some View {
        VStack {
            if type == .clean {
                TextField(placeHolder, text: $text)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true);
            } else if type == .secure {
                SecureField(placeHolder, text: $text)
            } else if type == .ordinary {
                TextField(placeHolder, text: $text)
            }
        }
    }
}

//struct InputView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        InputView(text: .constant("he"), type: .simple, placeHolder: "input")
//    }
//}
