//
//  File.swift
//  
//
//  Created by A1softech on 16/03/2023.
//

import Foundation
import network
public protocol UserRepositoryProtocol {
    func fetchUserCodable(compilition:  @escaping (UserCodable?,Error?) -> Void)
}
public class UserRepository: UserRepositoryProtocol {
    //var userTest = User(id: 0, email: "error")
    public init() {
    }
    public required init(name: String) {
        print(name)
    }
//    public func fetchUser() -> User {
//        fetchUserCodable { user, _ in
//            if let id = user?.id, let email = user?.email {
//                self.userTest = User(id: id, email: email)
//            }
//        }
//        print("Data1112 user test = \(self.userTest)")
//        return userTest
//    }
    public func fetchUserCodable(compilition:  @escaping (UserCodable?,Error?) -> Void) {
        DispatchQueue.main.async {
            let route = UserEndPoint.getSingleUser
            BaseRequest.shared.request(route: route, completion: compilition)
        }
    }
}
 public struct UserCodable: Decodable {
   public var id:Int
  public  var email:String
}
//extension Array where Element == UserCodable {
//    func toUser() -> [User] {
//        map {item in
//            User(id: item.id, email: item.email)}
//    }
//}
