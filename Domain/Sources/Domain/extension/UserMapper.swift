//
//  File.swift
//  
//
//  Created by Hassan on 25/03/2023.
//

import Foundation
import Core
public struct UserMapper {
    public func userCodableToUser(_ inuser: UserCodable) -> User {
          User(
            id: inuser.id
            , email: inuser.email
            , username: inuser.username
            , password: inuser.password
            ,name: Name(
                firstname: inuser.name?.firstname
                ,lastname: inuser.name?.lastname )
            ,address: Address(
                city: inuser.address?.city
                , street: inuser.address?.street
                , number: inuser.address?.number
                , zipcode: inuser.address?.zipcode
                , geolocation: Geolocation(
                    lat: inuser.address?.geolocation?.lat
                    , long: inuser.address?.geolocation?.long
                )
            )
            , phone: inuser.phone
        )
    }
}
