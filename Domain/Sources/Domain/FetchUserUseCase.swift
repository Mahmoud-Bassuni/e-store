//
//  File.swift
//  
//
//  Created by A1softech on 17/03/2023.
//

import Foundation

 public protocol UserRepositoryProtocol {
    func fetchUser() -> User
}

struct FetchUserUseCase {
    let userProtocol: UserRepositoryProtocol
    func fetchUserData() -> User {
        userProtocol.fetchUser()
    }
}

