//
//  File.swift
//  
//
//  Created by A1softech on 17/03/2023.
//

import Foundation
import Core

public struct FetchUserUseCase {
    public var closure : ((UserCodable? ) -> User)?
    let userProtocol = UserRepository()
    public init() {

    }
    public mutating func fetchUserData() -> User {
        var usertt : User = User(id: 0, email: " ")
        userProtocol.fetchUserCodable { [self]user, _ in
            print("Data111\(user)")
            self.closure?(user)
            print("Data111\(closure?(user).email)")
        }
        closure = { item in
            usertt = User(id: item?.id ?? 1, email: item?.email ?? "tt")
            print("Data11133\(usertt)")

            return usertt
                }
       // let test = closure
        return usertt
        }
}
