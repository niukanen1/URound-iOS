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
    @State var date: String = "";
    var body: some View {
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
            }
        }
    }
    
    mutating func setDate() {
        let isoDate = post.date
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "E MMM d yyyy HH:mm:ss 'GMT'Z (zzzz)"
        let date = dateFormatter.date(from:isoDate)
        if let date = date {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year, .month, .day, .hour], from: date)
            
            let finalDate = calendar.date(from:components)
            if let finalDate = finalDate {
                dateFormatter.timeStyle = .short
                dateFormatter.dateStyle = .short
                self.date = dateFormatter.string(from: finalDate);
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
