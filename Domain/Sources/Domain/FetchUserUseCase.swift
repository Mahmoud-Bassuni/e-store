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
    public init() {

    }
    public func fetchUserData( completion:  ((User) -> Void)? ) {
        userRepo.fetchUserCodable {  inuser, _ in
            completion?(User(id: inuser?.id ?? 0, email: inuser?.email ?? " "))
        }
        }
}
