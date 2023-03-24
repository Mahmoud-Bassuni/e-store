//
//  File.swift
//  
//
//  Created by Hassan on 23/03/2023.
//

import Foundation
import Core
public struct FetchUserUseCase {
    let userRepo = UserRepository()
    public init() {
    }
    public func fetchUserData( completion: @escaping ((User) -> Void) ) {
        userRepo.fetchUserCodable { result in
            switch result {
            case .failure(let error):
                print("Failure \(error)")
            case .success(let userCodable):
                completion(userCodable.toUser())
            }
        }
    }
    public func fetchUsersData( completion: @escaping (([User]) -> Void) ) {
        userRepo.fetchUsersCodable { result in
            switch result {
            case .success(let usersCodable):
                completion(usersCodable.toUser())
            case .failure(let error):
                print("failure \(error)")
            }
        }
    }
    public func fetchTokenLoginUser(loginInfo localLoginInfo: (userName:String,passWord:String), completion: @escaping (Token?, Error?) -> Void) {
        userRepo.loginUser(loginInfo: localLoginInfo) { result in
            switch result {
            case .success(let token):
                completion(token, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
