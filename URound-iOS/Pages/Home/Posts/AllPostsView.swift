//
//  AllPostsView.swift
//  URound-iOS
//
//  Created by Ivan Niukanen on 18.05.2022.
//

import SwiftUI



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
}

struct AllPostsView: View {
    @EnvironmentObject var postsData: PostsData
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var loaderInfo: LoaderModel
    @EnvironmentObject var errorBannerInfo: ErrorBannerModel
    
    @State var searchText = "";
    @State private var isFetchingPosts = false;
    
    init() {
        UITableView.appearance().separatorColor = .clear
    }
    var searchResults: [Post] {
        if searchText.isEmpty {
            return postsData.postsList
        } else {
            return postsData.postsList.filter { item in
                return item.title?.lowercased().contains(searchText.lowercased()) ?? false
            }
        }
    }
    var body: some View {
        NavigationView {
            List(searchResults, id: \._id) { post in
                ShortPostView(post: post)
                    .onAppear {
                        fetchBackground(post: post)
                    }
                    .background(NavigationLink("", destination: FullPostView(post: post)).opacity(0))
                
                .buttonStyle(PlainButtonStyle())
                .listRowBackground(Color.clear)
            }.listStyle(.plain)
            .navigationTitle(Text("Home"))
            if isFetchingPosts {
                HStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }.listRowBackground(Color.clear)
            }
            
            
            //            .searchable(text: $searchText)
            
        }
        .searchable(text: $searchText)
        .onAppear {
            if postsData.postsList.count == 0 {
                DispatchQueue.main.async {
                    fetchPosts(showBigLoader: true)
                }
                
            }
        }
        
    }
    
    func fetchPosts(showBigLoader: Bool = false) -> Void {
        if showBigLoader {
            loaderInfo.isLoading = true;
        } else {
            self.isFetchingPosts = true;
        }
        
        let userAuth: UserAuthInput = UserAuthInput(username: userData.getFromKeychain()!.username, password: userData.getFromKeychain()!.password)
        Network.shared.apollo.fetch(query: GetAllPostsQuery(currentLength: postsData.postsList.count, user: userAuth)) { result in
            switch result {
            case .success(let res):
                guard let data = res.data else { return }
                let response = data.getAllPosts;
                // checking for error
                if response.message.isError {
                    errorBannerInfo.Show(Message: response.message.description ?? "Something went wrong");
                } else {
                    guard let response_listOfPosts = response.list else {
                        return
                    }
                    let newArr = response_listOfPosts.compactMap({ Post(_id: $0._id, categories: $0.categories, title: $0.title, shortText: $0.shortText, fullText: $0.fullText, images: $0.images ?? [], videos: $0.videos ?? [], date: $0.date, owner: PostOwner(username: $0.owner?.username ?? "none"), href: $0.href)})
                    DispatchQueue.main.async {
                        postsData.postsList.append(contentsOf: newArr);
                    }
                }
            case .failure(let error) :
                errorBannerInfo.Show(Message: error.localizedDescription)
            }
            self.isFetchingPosts = false;
            loaderInfo.isLoading = false
        }
    }
    
    func fetchBackground(post: Post) {
        if postsData.postsList[postsData.postsList.count - 2]._id == post._id {
            fetchPosts();
        } else if postsData.postsList[postsData.postsList.count - 14]._id == post._id{
            DispatchQueue.global(qos: .unspecified).async {
                fetchPosts()
            }
        }
        
    }
}
struct AllPostsView_Previews: PreviewProvider {
    static var previews: some View {
        AllPostsView()
    }
}
