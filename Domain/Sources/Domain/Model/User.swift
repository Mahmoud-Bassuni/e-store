//
//  File.swift
//  
//
//  Created by Hassan on 23/03/2023.
//

import Foundation
import Core
public struct User {
    public var id:Int?
    public var email:String?
    public var username:String?
    public var password:String?
    public var name:Name?
    public var address:Address?
    public var phone:String?
    public init(id: Int? = nil, email: String? = nil, username: String? = nil, password: String? = nil, name: Name? = nil, address: Address? = nil, phone: String? = nil) {
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
    public var firstname:String?
    public var lastname:String?
    public init(firstname: String? = nil, lastname: String? = nil) {
        self.firstname = firstname
        self.lastname = lastname
    }
}
public  struct Address {
    public var city:String?
    public var street:String?
    public var number:Int?
    public var zipcode:String?
    public var geolocation:Geolocation?
    public init(city: String? = nil, street: String? = nil, number: Int? = nil, zipcode: String? = nil, geolocation: Geolocation? = nil) {
        self.city = city
        self.street = street
        self.number = number
        self.zipcode = zipcode
        self.geolocation = geolocation
    }
}
public struct Geolocation {
    public var lat: String?
    public var long: String?
    public init(lat: String? = nil, long: String? = nil) {
        self.lat = lat
        self.long = long
    }
}
