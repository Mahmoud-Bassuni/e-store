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
    public func login(loginInfo localLoginInfo: (userName:String,passWord:String), completion: @escaping (Result<Token, Error>) -> Void) {
        userRepo.loginUser(loginInfo: localLoginInfo) { result in
            switch result {
            case .success(let token):
                completion(.success(token))
            case .failure(let error):
                completion(.failure(error))            }
        }
    }
}
