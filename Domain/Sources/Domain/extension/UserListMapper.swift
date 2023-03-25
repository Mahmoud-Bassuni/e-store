//
//  File.swift
//  
//
//  Created by Hassan on 23/03/2023.
//

import Foundation
import Core
extension Array where Element == UserCodable {
   func toUser() -> [User] {
       map {item in
           UserMapper().userCodableToUser(item)
       }
   }
}
