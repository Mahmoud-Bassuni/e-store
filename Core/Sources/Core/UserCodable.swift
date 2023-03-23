//
//  File.swift
//  
//
//  Created by Hassan on 23/03/2023.
//

import Foundation
public struct UserCodable: Decodable {
    public var id:Int
    public var email:String
    public var username:String
    public var password:String
    public var name:Name
    public var address:Address
    public var phone:String
}
public struct Name: Decodable {
    public var firstname:String
    public var lastname:String
}
public  struct Address: Decodable {
    public var city:String
    public var street:String
    public var number:Int
    public var zipcode:String
    public var geolocation:Geolocation
}

public struct Geolocation: Decodable {
    public var lat: String
    public var long: String
}
