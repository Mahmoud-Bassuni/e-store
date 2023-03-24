//
//  File.swift
//  
//
//  Created by Hassan on 23/03/2023.
//

import Foundation
public struct UserCodable: Codable {
    public var id:Int?
    public var email:String?
    public var username:String?
    public var password:String?
    public var name:Name?
    public var address:Address?
    public var phone:String?
}
public struct Name: Codable {
    public var firstname:String?
    public var lastname:String?
}
public  struct Address: Codable {
    public var city:String?
    public var street:String?
    public var number:Int?
    public var zipcode:String?
    public var geolocation:Geolocation?
}
public struct Geolocation: Codable {
    public var lat: String?
    public var long: String?
}
