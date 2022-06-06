//
//  PostTypes.swift
//  URound-iOS
//
//  Created by Ivan Niukanen on 02.06.2022.
//

import Foundation

struct PostOwner {
    internal init(username: String) {
        self.username = username
    }
    let username: String
}

struct Post: Equatable {
    static func == (lhs: Post, rhs: Post) -> Bool {
        return lhs._id == rhs._id
    }
    
    internal init(_id: String, categories: [String?], title: String?, shortText: String?, fullText: String?, images: [String?], videos: [String?], date: String, owner: PostOwner?, href: String?) {
        self._id = _id
        self.categories = categories
        self.title = title
        self.shortText = shortText
        self.fullText = fullText
        self.images = images
        self.videos = videos
        self.date = date
        self.owner = owner
        self.href = href
    }
    
    let _id: String
    let categories: [String?]
    let title: String?
    let shortText: String?
    let fullText: String?
    let images: [String?]
    let videos: [String?]
    let date: String
    let owner: PostOwner?
    let href: String?
    
    
    func setDate() -> String? {
        let isoDate = self.date
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
                return dateFormatter.string(from: finalDate);
            }
        }
        return nil
    }

}
