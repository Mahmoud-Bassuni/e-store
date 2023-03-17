//
//  File.swift
//  
//
//  Created by A1softech on 16/03/2023.
//

import Foundation
public struct User {
    public let id: String
    public let email: String
    let fakeUser = (id : "123", email : " hassan")
    init(id: String , email: String ) {
//        let user = fakeUser
        self.id = id
        self.email = email
    }
    
}
