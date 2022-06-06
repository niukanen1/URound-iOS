//
//  AllPostsView.swift
//  URound-iOS
//
//  Created by Ivan Niukanen on 18.05.2022.
//

import SwiftUI


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
        //        NavigationView {
        NavigationView {
            List(searchResults, id: \._id) { post in
                    ShortPostView(post: post)
                        .onAppear {
                            fetchBackground(post: post)
                        }
                        .background(NavigationLink("", destination: FullPostView(post: post)).opacity(0))
                        .buttonStyle(PlainButtonStyle())
                        .padding(.bottom, 40)
            }.onAppear {
                if postsData.postsList.count == 0 {
                    DispatchQueue.main.async {
                        fetchPosts(showBigLoader: true)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Home")
            if isFetchingPosts {
                HStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }.listRowBackground(Color.clear)
            }
        }
        .searchable(text: $searchText)
        //        }
        
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
                    let newArr = convertGraphPostListToPost(list: response_listOfPosts);
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
    func ServerSearch(text: String) {
        let UserAuth = UserAuthInput(username: userData.getFromKeychain()!.username, password: userData.getFromKeychain()!.password);
        Network.shared.apollo.fetch(query: SearchPostsQuery(text: text, user: UserAuth)) { result in
            switch result {
            case .success(let res):
                guard let res = res.data else { return }
                if res.searchPost.message.isError {
                    errorBannerInfo.Show(Message: res.searchPost.message.description!);
                    return
                }
                
            case .failure(let err):
                print(err)
            }
        }
    }
    func convertGraphPostListToPost(list: [GetAllPostsQuery.Data.GetAllPost.List]) -> [Post] {
        let newArr = list.compactMap({ Post(_id: $0._id, categories: $0.categories, title: $0.title, shortText: $0.shortText, fullText: $0.fullText, images: $0.images ?? [], videos: $0.videos ?? [], date: $0.date, owner: PostOwner(username: $0.owner?.username ?? "none"), href: $0.href)})
        return newArr
    }
}
struct AllPostsView_Previews: PreviewProvider {
    static var previews: some View {
        AllPostsView()
    }
}
