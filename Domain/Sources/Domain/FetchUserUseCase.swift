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
    public func fetchUserData( compeletion:  ((User)->Void)? ) {
        userRepo.fetchUserCodable {  inuser, _ in
           print("fetchUserData\(inuser)")
            compeletion?(User(id: inuser?.id ?? 2, email: inuser?.email ?? "ff"))
        }
        }
}
