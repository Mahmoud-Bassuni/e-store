//
//  File.swift
//  
//
//  Created by Hassan on 23/03/2023.
//

import Foundation
import Core
public struct UserUseCase {
    let userRepo = UserRepository()
    public init() {
    }
    public func fetchUserData( completion: @escaping ((User) -> Void) ) {
        userRepo.fetchUser { result in
            switch result {
            case .failure(let error):
                print("Failure \(error)")
            case .success(let userCodable):
                completion(UserMapper().userCodableToUser(userCodable))
            }
        }
    }
    public func fetchUsersData( completion: @escaping (([User]) -> Void) ) {
        userRepo.fetchUsers { result in
            switch result {
            case .success(let usersCodable):
                completion(usersCodable.toUser())
            case .failure(let error):
                print("failure \(error)")
            }
        }
    }
    public func login(loginInfo localLoginInfo: (userName:String,passWord:String), completion: @escaping (Token) -> Void) {
        userRepo.loginUser(loginInfo: localLoginInfo) { result in
            switch result {
            case .success(let token):
                completion(token)
            case .failure(let error):
                print("failure \(error)")
            }
        }
    }
}
