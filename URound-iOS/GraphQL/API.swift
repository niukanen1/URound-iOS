// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct UserAuthInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - username
  ///   - password
  public init(username: String, password: String) {
    graphQLMap = ["username": username, "password": password]
  }

  public var username: String {
    get {
      return graphQLMap["username"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "username")
    }
  }

  public var password: String {
    get {
      return graphQLMap["password"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "password")
    }
  }
}

public struct UserInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - username
  ///   - email
  ///   - password
  ///   - firstName
  ///   - lastName
  ///   - profileImage
  public init(username: String, email: String, password: String, firstName: String, lastName: String, profileImage: Swift.Optional<String?> = nil) {
    graphQLMap = ["username": username, "email": email, "password": password, "firstName": firstName, "lastName": lastName, "profileImage": profileImage]
  }

  public var username: String {
    get {
      return graphQLMap["username"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "username")
    }
  }

  public var email: String {
    get {
      return graphQLMap["email"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var password: String {
    get {
      return graphQLMap["password"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "password")
    }
  }

  public var firstName: String {
    get {
      return graphQLMap["firstName"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "firstName")
    }
  }

  public var lastName: String {
    get {
      return graphQLMap["lastName"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lastName")
    }
  }

  public var profileImage: Swift.Optional<String?> {
    get {
      return graphQLMap["profileImage"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "profileImage")
    }
  }
}

public final class GetAllUsersQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetAllUsers {
      getAllUsers {
        __typename
        _id
        username
        email
        firstName
        lastName
        hashedPassword
        profileImage
      }
    }
    """

  public let operationName: String = "GetAllUsers"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getAllUsers", type: .nonNull(.list(.nonNull(.object(GetAllUser.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getAllUsers: [GetAllUser]) {
      self.init(unsafeResultMap: ["__typename": "Query", "getAllUsers": getAllUsers.map { (value: GetAllUser) -> ResultMap in value.resultMap }])
    }

    public var getAllUsers: [GetAllUser] {
      get {
        return (resultMap["getAllUsers"] as! [ResultMap]).map { (value: ResultMap) -> GetAllUser in GetAllUser(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: GetAllUser) -> ResultMap in value.resultMap }, forKey: "getAllUsers")
      }
    }

    public struct GetAllUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("_id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("username", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("firstName", type: .scalar(String.self)),
          GraphQLField("lastName", type: .scalar(String.self)),
          GraphQLField("hashedPassword", type: .nonNull(.scalar(String.self))),
          GraphQLField("profileImage", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(_id: GraphQLID, username: String, email: String, firstName: String? = nil, lastName: String? = nil, hashedPassword: String, profileImage: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "_id": _id, "username": username, "email": email, "firstName": firstName, "lastName": lastName, "hashedPassword": hashedPassword, "profileImage": profileImage])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var _id: GraphQLID {
        get {
          return resultMap["_id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "_id")
        }
      }

      public var username: String {
        get {
          return resultMap["username"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "username")
        }
      }

      public var email: String {
        get {
          return resultMap["email"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      public var firstName: String? {
        get {
          return resultMap["firstName"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "firstName")
        }
      }

      public var lastName: String? {
        get {
          return resultMap["lastName"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "lastName")
        }
      }

      public var hashedPassword: String {
        get {
          return resultMap["hashedPassword"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "hashedPassword")
        }
      }

      public var profileImage: String? {
        get {
          return resultMap["profileImage"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "profileImage")
        }
      }
    }
  }
}

public final class LoginQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Login($username: String!, $password: String!) {
      login(username: $username, password: $password) {
        __typename
        message {
          __typename
          isError
          description
        }
        isLoggedIn
        userInfo {
          __typename
          _id
          username
          email
          firstName
          lastName
          hashedPassword
          profileImage
        }
      }
    }
    """

  public let operationName: String = "Login"

  public var username: String
  public var password: String

  public init(username: String, password: String) {
    self.username = username
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["username": username, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("login", arguments: ["username": GraphQLVariable("username"), "password": GraphQLVariable("password")], type: .nonNull(.object(Login.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(login: Login) {
      self.init(unsafeResultMap: ["__typename": "Query", "login": login.resultMap])
    }

    public var login: Login {
      get {
        return Login(unsafeResultMap: resultMap["login"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "login")
      }
    }

    public struct Login: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["LoginResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("message", type: .nonNull(.object(Message.selections))),
          GraphQLField("isLoggedIn", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("userInfo", type: .object(UserInfo.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(message: Message, isLoggedIn: Bool, userInfo: UserInfo? = nil) {
        self.init(unsafeResultMap: ["__typename": "LoginResponse", "message": message.resultMap, "isLoggedIn": isLoggedIn, "userInfo": userInfo.flatMap { (value: UserInfo) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var message: Message {
        get {
          return Message(unsafeResultMap: resultMap["message"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "message")
        }
      }

      public var isLoggedIn: Bool {
        get {
          return resultMap["isLoggedIn"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isLoggedIn")
        }
      }

      public var userInfo: UserInfo? {
        get {
          return (resultMap["userInfo"] as? ResultMap).flatMap { UserInfo(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "userInfo")
        }
      }

      public struct Message: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Message"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("isError", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("description", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(isError: Bool, description: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Message", "isError": isError, "description": description])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var isError: Bool {
          get {
            return resultMap["isError"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isError")
          }
        }

        public var description: String? {
          get {
            return resultMap["description"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }
      }

      public struct UserInfo: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("_id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("username", type: .nonNull(.scalar(String.self))),
            GraphQLField("email", type: .nonNull(.scalar(String.self))),
            GraphQLField("firstName", type: .scalar(String.self)),
            GraphQLField("lastName", type: .scalar(String.self)),
            GraphQLField("hashedPassword", type: .nonNull(.scalar(String.self))),
            GraphQLField("profileImage", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(_id: GraphQLID, username: String, email: String, firstName: String? = nil, lastName: String? = nil, hashedPassword: String, profileImage: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "_id": _id, "username": username, "email": email, "firstName": firstName, "lastName": lastName, "hashedPassword": hashedPassword, "profileImage": profileImage])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var _id: GraphQLID {
          get {
            return resultMap["_id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "_id")
          }
        }

        public var username: String {
          get {
            return resultMap["username"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "username")
          }
        }

        public var email: String {
          get {
            return resultMap["email"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email")
          }
        }

        public var firstName: String? {
          get {
            return resultMap["firstName"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "firstName")
          }
        }

        public var lastName: String? {
          get {
            return resultMap["lastName"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "lastName")
          }
        }

        public var hashedPassword: String {
          get {
            return resultMap["hashedPassword"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "hashedPassword")
          }
        }

        public var profileImage: String? {
          get {
            return resultMap["profileImage"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "profileImage")
          }
        }
      }
    }
  }
}

public final class GetAllPostsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetAllPosts($currentLength: Int!, $user: UserAuthInput!) {
      getAllPosts(currentLength: $currentLength, User: $user) {
        __typename
        message {
          __typename
          isError
          description
        }
        list {
          __typename
          _id
          categories
          title
          shortText
          fullText
          images
          videos
          date
          owner {
            __typename
            username
          }
          href
        }
      }
    }
    """

  public let operationName: String = "GetAllPosts"

  public var currentLength: Int
  public var user: UserAuthInput

  public init(currentLength: Int, user: UserAuthInput) {
    self.currentLength = currentLength
    self.user = user
  }

  public var variables: GraphQLMap? {
    return ["currentLength": currentLength, "user": user]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getAllPosts", arguments: ["currentLength": GraphQLVariable("currentLength"), "User": GraphQLVariable("user")], type: .nonNull(.object(GetAllPost.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getAllPosts: GetAllPost) {
      self.init(unsafeResultMap: ["__typename": "Query", "getAllPosts": getAllPosts.resultMap])
    }

    public var getAllPosts: GetAllPost {
      get {
        return GetAllPost(unsafeResultMap: resultMap["getAllPosts"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "getAllPosts")
      }
    }

    public struct GetAllPost: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["PostListResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("message", type: .nonNull(.object(Message.selections))),
          GraphQLField("list", type: .list(.nonNull(.object(List.selections)))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(message: Message, list: [List]? = nil) {
        self.init(unsafeResultMap: ["__typename": "PostListResponse", "message": message.resultMap, "list": list.flatMap { (value: [List]) -> [ResultMap] in value.map { (value: List) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var message: Message {
        get {
          return Message(unsafeResultMap: resultMap["message"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "message")
        }
      }

      public var list: [List]? {
        get {
          return (resultMap["list"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [List] in value.map { (value: ResultMap) -> List in List(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [List]) -> [ResultMap] in value.map { (value: List) -> ResultMap in value.resultMap } }, forKey: "list")
        }
      }

      public struct Message: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Message"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("isError", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("description", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(isError: Bool, description: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Message", "isError": isError, "description": description])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var isError: Bool {
          get {
            return resultMap["isError"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isError")
          }
        }

        public var description: String? {
          get {
            return resultMap["description"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }
      }

      public struct List: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Post"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("_id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("categories", type: .nonNull(.list(.scalar(String.self)))),
            GraphQLField("title", type: .scalar(String.self)),
            GraphQLField("shortText", type: .scalar(String.self)),
            GraphQLField("fullText", type: .scalar(String.self)),
            GraphQLField("images", type: .list(.scalar(String.self))),
            GraphQLField("videos", type: .list(.scalar(String.self))),
            GraphQLField("date", type: .nonNull(.scalar(String.self))),
            GraphQLField("owner", type: .object(Owner.selections)),
            GraphQLField("href", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(_id: GraphQLID, categories: [String?], title: String? = nil, shortText: String? = nil, fullText: String? = nil, images: [String?]? = nil, videos: [String?]? = nil, date: String, owner: Owner? = nil, href: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Post", "_id": _id, "categories": categories, "title": title, "shortText": shortText, "fullText": fullText, "images": images, "videos": videos, "date": date, "owner": owner.flatMap { (value: Owner) -> ResultMap in value.resultMap }, "href": href])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var _id: GraphQLID {
          get {
            return resultMap["_id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "_id")
          }
        }

        public var categories: [String?] {
          get {
            return resultMap["categories"]! as! [String?]
          }
          set {
            resultMap.updateValue(newValue, forKey: "categories")
          }
        }

        public var title: String? {
          get {
            return resultMap["title"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public var shortText: String? {
          get {
            return resultMap["shortText"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "shortText")
          }
        }

        public var fullText: String? {
          get {
            return resultMap["fullText"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "fullText")
          }
        }

        public var images: [String?]? {
          get {
            return resultMap["images"] as? [String?]
          }
          set {
            resultMap.updateValue(newValue, forKey: "images")
          }
        }

        public var videos: [String?]? {
          get {
            return resultMap["videos"] as? [String?]
          }
          set {
            resultMap.updateValue(newValue, forKey: "videos")
          }
        }

        public var date: String {
          get {
            return resultMap["date"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "date")
          }
        }

        public var owner: Owner? {
          get {
            return (resultMap["owner"] as? ResultMap).flatMap { Owner(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "owner")
          }
        }

        public var href: String? {
          get {
            return resultMap["href"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "href")
          }
        }

        public struct Owner: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Owner"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("username", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(username: String) {
            self.init(unsafeResultMap: ["__typename": "Owner", "username": username])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var username: String {
            get {
              return resultMap["username"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "username")
            }
          }
        }
      }
    }
  }
}

public final class AddUserMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation AddUser($user: UserInput!) {
      addUser(User: $user) {
        __typename
        message {
          __typename
          isError
          description
        }
        userInfo {
          __typename
          _id
          username
          email
          firstName
          lastName
          hashedPassword
          profileImage
        }
      }
    }
    """

  public let operationName: String = "AddUser"

  public var user: UserInput

  public init(user: UserInput) {
    self.user = user
  }

  public var variables: GraphQLMap? {
    return ["user": user]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("addUser", arguments: ["User": GraphQLVariable("user")], type: .nonNull(.object(AddUser.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addUser: AddUser) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "addUser": addUser.resultMap])
    }

    public var addUser: AddUser {
      get {
        return AddUser(unsafeResultMap: resultMap["addUser"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "addUser")
      }
    }

    public struct AddUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["BasicUserResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("message", type: .nonNull(.object(Message.selections))),
          GraphQLField("userInfo", type: .object(UserInfo.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(message: Message, userInfo: UserInfo? = nil) {
        self.init(unsafeResultMap: ["__typename": "BasicUserResponse", "message": message.resultMap, "userInfo": userInfo.flatMap { (value: UserInfo) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var message: Message {
        get {
          return Message(unsafeResultMap: resultMap["message"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "message")
        }
      }

      public var userInfo: UserInfo? {
        get {
          return (resultMap["userInfo"] as? ResultMap).flatMap { UserInfo(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "userInfo")
        }
      }

      public struct Message: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Message"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("isError", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("description", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(isError: Bool, description: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Message", "isError": isError, "description": description])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var isError: Bool {
          get {
            return resultMap["isError"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isError")
          }
        }

        public var description: String? {
          get {
            return resultMap["description"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }
      }

      public struct UserInfo: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("_id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("username", type: .nonNull(.scalar(String.self))),
            GraphQLField("email", type: .nonNull(.scalar(String.self))),
            GraphQLField("firstName", type: .scalar(String.self)),
            GraphQLField("lastName", type: .scalar(String.self)),
            GraphQLField("hashedPassword", type: .nonNull(.scalar(String.self))),
            GraphQLField("profileImage", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(_id: GraphQLID, username: String, email: String, firstName: String? = nil, lastName: String? = nil, hashedPassword: String, profileImage: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "_id": _id, "username": username, "email": email, "firstName": firstName, "lastName": lastName, "hashedPassword": hashedPassword, "profileImage": profileImage])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var _id: GraphQLID {
          get {
            return resultMap["_id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "_id")
          }
        }

        public var username: String {
          get {
            return resultMap["username"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "username")
          }
        }

        public var email: String {
          get {
            return resultMap["email"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email")
          }
        }

        public var firstName: String? {
          get {
            return resultMap["firstName"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "firstName")
          }
        }

        public var lastName: String? {
          get {
            return resultMap["lastName"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "lastName")
          }
        }

        public var hashedPassword: String {
          get {
            return resultMap["hashedPassword"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "hashedPassword")
          }
        }

        public var profileImage: String? {
          get {
            return resultMap["profileImage"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "profileImage")
          }
        }
      }
    }
  }
}
