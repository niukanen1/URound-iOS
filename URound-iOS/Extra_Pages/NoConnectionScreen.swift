//
//  NoConnectionScreen.swift
//  URound-iOS
//
//  Created by Ivan Niukanen on 29.05.2022.
//

import SwiftUI

struct NoConnectionScreen: View {
    let retryFunc: () -> Void
    var body: some View {
        VStack {
            Image(systemName: "wifi.slash")
                .font(.system(size: 120))
            Button(action: {
                retryFunc(); 
            }) {
                Text("Try again")
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding()
                    .background(Rectangle().cornerRadius(10))
            }
            .padding(.top, 30)
        }
    }
}

struct NoConnectionScreen_Previews: PreviewProvider {
    static var previews: some View {
        NoConnectionScreen(retryFunc: {print("")})
    }
}
