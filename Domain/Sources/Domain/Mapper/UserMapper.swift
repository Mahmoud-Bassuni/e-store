//
//  File.swift
//  
//
//  Created by Hassan on 25/03/2023.
//

import Foundation
import Core
public struct UserMapper {
    public func transformCodableToUser(_ model: UserCodable) -> User {
          User(
            id: model.id
            , email: model.email
            , username: model.username
            , password: model.password
            ,name: Name(
                firstname: model.name?.firstname
                ,lastname: model.name?.lastname )
            ,address: Address(
                city: model.address?.city
                , street: model.address?.street
                , number: model.address?.number
                , zipcode: model.address?.zipcode
                , geolocation: Geolocation(
                    lat: model.address?.geolocation?.lat
                    , long: model.address?.geolocation?.long
                )
            )
            , phone: model.phone
        )
    }
}
