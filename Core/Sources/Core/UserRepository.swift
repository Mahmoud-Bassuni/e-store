//
//  File.swift
//  
//
//  Created by A1softech on 16/03/2023.
//

import Foundation
import network
public protocol UserRepositoryProtocol {
    func fetchUserCodable(completion:  @escaping (UserCodable?,Error?) -> Void)
}
public class UserRepository: UserRepositoryProtocol {
    public init() {
    }
    public required init(coder: NSCoder) {
    }

    public func fetchUserCodable(completion:  @escaping (UserCodable?,Error?) -> Void) {
            let route = UserEndPoint.getSingleUser
            BaseRequest.shared.request(route: route, completion: completion)
    }
}

// extension Array where Element == UserCodable {
//    func toUser() -> [User] {
//        map {item in
//            User(id: item.id, email: item.email)}
//    }
// }
