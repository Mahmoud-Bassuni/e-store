//
//  File.swift
//  
//
//  Created by A1softech on 16/03/2023.
//

import Foundation
import network
public protocol UserRepositoryProtocol {
    func fetchUser() -> User
}
public class UserRepository: UserRepositoryProtocol {
    var userTest : UserCodable?
    public init() {
        fetchTest()
    }
    public required init(name: String) {
        print(name)
    }
    public func fetchUser() -> User {
       
        fetchUserCodable { user, _ in
            print("Data111\(user)")
            self.userTest = user
        }
        print("Data111 user test = \(self.userTest)")
        return User(id: userTest?.id ?? 0 , email: userTest?.email ?? "")
    }
    private func fetchTest() {
       
    }
    func fetchUserCodable(compilition:  @escaping (UserCodable?,Error?) -> Void) {
        DispatchQueue.main.async {
            let route = UserEndPoint.getSingleUser
            BaseRequest.shared.request(route: route, completion: compilition)
        }
    }
}
struct UserCodable: Decodable {
    var id:Int
    var email:String
}
