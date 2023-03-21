//
//  File.swift
//  
//
//  Created by Hassan on 20/03/2023.
//

import Foundation
public struct UserCodable: Decodable {
    public var id:Int
    public var email:String
    public var username:String
    public var password:String
//    public var name:Name
//    public var address:Address
    public var phone:String
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
