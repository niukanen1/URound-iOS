//
//  URLImageView.swift
//  URound-iOS
//
//  Created by Ivan Niukanen on 26.05.2022.
//

import SwiftUI

class ImageCache {
    var cache = NSCache<NSString, UIImage>();
    
    func get(Value: String) -> UIImage? {
        return cache.object(forKey: NSString(string: Value));
    }
    func set(Value: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: Value))
    }
}

extension ImageCache {
    private static var imageCache = ImageCache()
    static func getImageCache() -> ImageCache {
        return imageCache
    }
}

struct URLImageView: View {
    init(url: String) {
        self.imageCache = ImageCache.getImageCache()
        self.url = url;
        self.postData = PostModel(image: imageCache.get(Value: url))
    }
    var imageCache = ImageCache.getImageCache();
    var url: String {
        didSet {
            self.loadImage(urlString: url)
        }
    }
    
    @ObservedObject var postData = PostModel()
    @State private var hasLoaded: Bool = false;
    
    
    
    var body: some View {
        if postData.image == nil {
            ZStack {
                Color.gray
                ProgressView()
                    
            }
            .frame(height: 200)
            .onAppear {
                if postData.image == nil {
                    loadImage(urlString: url)
                }
            }
        } else {
            Image(uiImage: postData.image ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
        }
    }
    
    
    func loadImage(urlString: String ) {
        // try to get image from cache

        
        if let cacheImage = self.imageCache.get(Value: urlString) {
            DispatchQueue.main.async {
//                withAnimation {
                    self.postData.image = cacheImage;
//                }
            }
            return
        }
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            guard let image = UIImage(data: data) else { return };
            self.imageCache.set(Value: urlString, image: image);
            DispatchQueue.main.async {
//                withAnimation {
                    self.postData.image = image;
//                }
            }
        }
        task.resume();
    }
}


struct URLImageView_Previews: PreviewProvider {
    static var previews: some View {
        URLImageView(url: "https://s.err.ee/photo/crop/2022/05/29/1493698h1024t4.png")
    }
}
