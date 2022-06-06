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
    var fullText: String {
        if let text = post.fullText {
            return text
        }
        return ""
    }
    var date: String {
        if let date = post.setDate() {
            return date
        }
        return ""
    }
    @State var imagesURLs: [String] = [];
    var body: some View {
        ScrollView {
                ForEach(imagesURLs, id: \.self) { url in
                    URLImageView(url: url)
                        .ignoresSafeArea(.all)
                }
                VStack(alignment: .leading) {
                    
                    Text(Title)
                        .font(.largeTitle)
                    HStack {
                        Spacer()
                        Text(date)
                            .font(.footnote)
                    }
                    .padding(.top, -20)
                    Text(fullText)
                }.padding(.horizontal)
            
        }
        .frame(width: UIScreen.main.bounds.width)
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
