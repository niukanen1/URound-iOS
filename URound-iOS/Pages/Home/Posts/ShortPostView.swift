//
//  PostView.swift
//  URound-iOS
//
//  Created by Ivan Niukanen on 26.05.2022.
//

import SwiftUI
import Foundation

struct ShortPostView: View {
    let post: Post
    var date: String  {
        if let date = post.setDate() {
            return date;
        }
        return ""
    }
    var body: some View {

        ZStack {
//            Color.white
            VStack(alignment: .leading) {
                if let imageURL = post.images[0] {
                    URLImageView(url: imageURL)
                }
                if let title = post.title {
                    Text(title)
                        .font(.title)
                        .padding(.bottom)

                }
                if let shortText = post.shortText {
                    Text(shortText);
                }
                HStack {
                    Spacer()
                    Text(date)
                        .font(.footnote)
                }
                
            }
        }
    }
    
    func convertDateToString(date: Date) -> String {
        let dateFormatter = DateFormatter();
        dateFormatter.timeStyle = .none;
        dateFormatter.dateStyle = .long;
        return dateFormatter.string(from: date);
    }
}

struct ShortPostView_Previews: PreviewProvider {
    static var previews: some View {
        ShortPostView(post: Post(_id: "some", categories: ["asd"], title: "asdfa", shortText: "asda", fullText: "ad", images: ["ada"], videos: ["asda"], date: "asd", owner: PostOwner(username: "asdad"), href: "asdasd"))
    }
}
