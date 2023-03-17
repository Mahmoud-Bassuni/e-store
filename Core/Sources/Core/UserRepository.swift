//
//  File.swift
//  
//
//  Created by A1softech on 16/03/2023.
//

import Foundation
public protocol UserRepositoryProtocol {
    func fetchUser() -> User
}
public class UserRepository: UserRepositoryProtocol{
    public init() {
        
    }
    public required init(name: String) {
        print(name)
    }
    public func fetchUser() -> User {
        let hassan = User(id: "123", email: "hassan")
        return hassan
    }
}
