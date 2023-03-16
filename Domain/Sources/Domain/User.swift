//
//  File.swift
//  
//
//  Created by A1softech on 16/03/2023.
//

import Foundation
public class User {
    let id: String
    let email: String
    let fakeUser = (id : "123", email : " hassan")
    public init( ) {
        let user = fakeUser
        id = user.id
        email = user.email
    }
}
