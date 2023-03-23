//
//  File.swift
//  
//
//  Created by Hassan on 23/03/2023.
//

import Foundation
public struct FetchUserUseCase {
    let userRepo = UserRepository()
    public init() {
    }
    public func fetchUserData( completion: @escaping ((User) -> Void) ) {
        userRepo.fetchUserCodable {  userCodable, _ in
                completion(userCodable.toUser())
        }
}
    public func fetchUsersData( completion: @escaping (([User]) -> Void) ) {
        userRepo.fetchUsersCodable {  inuser, _ in
            completion(inuser?.toUser() ?? [User()])
        }
    }
    public func fetchTokenLoginUser(loginInfo localLoginInfo: (userName:String,passWord:String), completion: @escaping (Token?, Error?) -> Void) {
        userRepo.loginUser(loginInfo: localLoginInfo) { token, error in
            completion(token,error)
        }
    }
}
