//
//  File.swift
//  
//
//  Created by A1softech on 16/03/2023.
//

import Foundation
import Core
public struct User {
    public var id:Int
    public var email:String
    public var username:String
    public var password:String
    public var name:Name
    public var address:Address
    public var phone:String
    public init(id: Int = 0, email: String = "error", username: String = "error", password: String = "error", name: Name = Name(), address: Address = Address(), phone: String = "error") {
        self.id = id
        self.email = email
        self.username = username
        self.password = password
        self.name = name
        self.address = address
        self.phone = phone
    }
}
public struct Name {
    public var firstname:String
    public var lastname:String
    public init(firstname: String = "error", lastname: String = "error") {
        self.firstname = firstname
        self.lastname = lastname
    }
}
public struct Address {
    public var city:String
    public var street:String
    public var number:Int
    public var zipcode:String
    public var geolocation: Geolocation
    public init(city: String = "error", street: String = "error", number: Int = 0, zipcode: String = "error", geolocation: Geolocation = Geolocation()) {
        self.city = city
        self.street = street
        self.number = number
        self.zipcode = zipcode
        self.geolocation = geolocation
    }
}
public struct Geolocation {
    public var lat: String
    public var long: String
    public init(lat: String = "error", long: String = "error") {
        self.lat = lat
        self.long = long
    }
}
extension UserCodable {
    public func toUser() -> User {
        let inuser = self
      return  User(
            id: inuser.id
            , email: inuser.email
            , username: inuser.username
            , password: inuser.password
            ,name: Name(
                firstname: inuser.name.firstname
                ,lastname: inuser.name.lastname )
            ,address: Address(
                city: inuser.address.city
                , street: inuser.address.street
                , number: inuser.address.number
                , zipcode: inuser.address.zipcode
                , geolocation: Geolocation(
                    lat: inuser.address.geolocation.lat
                    , long: inuser.address.geolocation.long
                )
            )
            , phone: inuser.phone
        )
    }
}
