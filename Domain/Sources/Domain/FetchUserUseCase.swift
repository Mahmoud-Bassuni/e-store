//
//  File.swift
//  
//
//  Created by A1softech on 17/03/2023.
//

import Foundation
import Core

public struct FetchUserUseCase {
    let userRepo = UserRepository()
    let defaultUser = User(id: 0, email: "error", username: "error", password: "error", phone: "error")
    public init() {

    }
    public func fetchUserData( completion:  ((User) -> Void)? ) {
        userRepo.fetchUserCodable {  inuser, _ in
            completion?(User(
                id: inuser?.id ?? defaultUser.id
                , email: inuser?.email ?? defaultUser.email
                , username: inuser?.username ?? defaultUser.username
                , password: inuser?.password ?? defaultUser.password
                , phone: inuser?.phone ?? defaultUser.phone))
        }
    }
    public func fetchUsersData( completion:  (([User]) -> Void)? ) {
        userRepo.fetchUsersCodable {  inuser, _ in
            completion?(inuser?.toUser() ?? [defaultUser])
        }
    }
}
