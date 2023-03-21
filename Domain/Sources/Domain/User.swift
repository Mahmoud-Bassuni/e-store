//
//  File.swift
//  
//
//  Created by A1softech on 16/03/2023.
//

import Foundation
import Core

public struct User: Decodable {
    public var id:Int
    public var email:String
    public var username:String
    public var password:String
//    public var name:Name
//    public var address:Address
    public var phone:String
    public init(id: Int, email: String, username: String, password: String, phone: String) {
        self.id = id
        self.email = email
        self.username = username
        self.password = password
        self.phone = phone
    }
}
public struct Name {
    public var firstname:String
    public var lastname:String
}
public  struct Address {
    public var city:String
    public var street:String
    public var number:Int
    public var zipcode:String
    public var geolocation:( lat: String,long: String)
}

 extension Array where Element == UserCodable {
    func toUser() -> [User] {
        map {item in
            User(id: item.id, email: item.email, username: item.username, password: item.password, phone: item.phone)}
    }
 }
