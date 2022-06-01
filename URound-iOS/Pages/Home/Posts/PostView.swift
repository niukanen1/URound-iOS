//
//  PostView.swift
//  URound-iOS
//
//  Created by Ivan Niukanen on 01.06.2022.
//

import SwiftUI


struct PostView: View {
    @Namespace private var namespace;
    var post: Post;
    
    var title: String {
        guard let Title = post.title else { return "" }
        return Title
    }
    
    var shortText: String {
        guard let text = post.shortText else { return "" }
        return text
    }
    
    var titleImageUrl: String {
        guard let url = post.images[0] else { return "" }
        return url
    }
    
    @State private var PickedId: String?;
    
    var body: some View {
        ZStack {
            
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post(_id: "some", categories: ["asd"], title: "asdfa", shortText: "asda", fullText: "ad", images: ["https://s.err.ee/photo/crop/2020/04/29/774536h663at4.jpg"], videos: ["asda"], date: "asd", owner: PostOwner(username: "asdad"), href: "asdasd"))
    }
}
