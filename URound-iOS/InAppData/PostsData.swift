//
//  PostsData.swift
//  URound-iOS
//
//  Created by Ivan Niukanen on 23.05.2022.
//

import Foundation


class PostsData: ObservableObject {
//    @Published var postsList: [GetAllPostsQuery.Data.GetAllPost.List] = [];
    @Published var postsList: [Post] = [];
}
