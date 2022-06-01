//
//  SwiftUIView.swift
//  URound-iOS
//
//  Created by Ivan Niukanen on 30.05.2022.
//

import SwiftUI

struct FullPostView: View {
    let post: Post
    var Title: String {
        if let title = post.title {
            return title
        }
        return ""
    }
    @State var imagesURLs: [String] = [];
    var body: some View {
        ScrollView {
            //            Text(Title)
            //                .font(.title)
            VStack {
                Text("Length is \(imagesURLs.count)")
                ForEach(imagesURLs, id: \.self) { url in
                    URLImageView(url: url)
                }
            }
            
            //            if let fullText = post.fullText {
            //                Text(fullText)
            //            }
            
        }.padding(.horizontal)
            .onAppear {
                getMultipleImages()
            }
    }
    
    func getMultipleImages() {
        for image in post.images {
            if let image = image {
                DispatchQueue.main.async {
                    self.imagesURLs.append(image)
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        FullPostView(post: Post(_id: "some", categories: ["asd"], title: "asdfa", shortText: "asda", fullText: "ad", images: ["ada"], videos: ["asda"], date: "asd", owner: PostOwner(username: "asdad"), href: "asdasd"))
    }
}
