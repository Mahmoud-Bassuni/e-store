//
//  File.swift
//  
//
//  Created by A1softech on 17/03/2023.
//

import Foundation
import Core

public struct FetchUserUseCase {
    let userProtocol = UserRepository()
    public init() {

    }
    public func fetchUserData() -> User {
        userProtocol.fetchUser()
        }
}
