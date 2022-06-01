//
//  ErrorBanner.swift
//  URound-iOS
//
//  Created by Ivan Niukanen on 18.04.2022.
//

import SwiftUI


struct ErrorBannerModifier: ViewModifier {
    @EnvironmentObject var errorBannerInfo: ErrorBannerModel
    func body(content: Content) -> some View {
        ZStack {
            content
            if self.errorBannerInfo.isShowing {
                VStack {
                    ErrorBannerView(text: $errorBannerInfo.text)
                        .padding(.top, 50)
                    Spacer()
                }.onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        DelayHideErrorBanner();
                    }
                }
                .transition(AnyTransition.move(edge: .top).animation(.easeIn(duration: 0.5)))
            }
        }
    }
    func DelayHideErrorBanner() {
        withAnimation {
            self.errorBannerInfo.isShowing = false;
        }
        
    }
}

extension View {
    func errorBanner() -> some View {
        self.modifier(ErrorBannerModifier());
    }
}

struct ErrorBannerView: View {
    @Binding var text: String
    
    var body: some View {
        VStack {
            Text(text)
                .font(.title2)
                .fontWeight(.bold)
            
        }
        .foregroundColor(.white)
        .padding()
        .padding(.horizontal, 30)
        .background(Rectangle().fill(Color.red).cornerRadius(15))
        .transition(AnyTransition.move(edge: .top).animation(.easeIn(duration: 0.5)))
    }
}
