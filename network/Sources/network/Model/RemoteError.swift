//
//  File.swift
//  
//
//  Created by Bassuni on 07/04/2023.
//

import Foundation

enum RemoteError: Error , Decodable {

    //MARK: - cases

    case unauthroized(message: String)
    case unKnownError(message: String)
    case genericError(message: String)

    //MARK: - Coding keys

   private enum CodingKeys: String , CodingKey {
        case error
        case message
    }

    // MARK: - Init

    public init(from decoder: Decoder) throws {

        let containner = try decoder.container(keyedBy: CodingKeys.self)
        let error = try containner.decode(String.self, forKey: .error)
        let message = try containner.decode(String.self, forKey: .message)


        switch error {

        case ErrorCodes.unauthroized :
            self = .unauthroized(message: "there is some user login with the same account")
        case ErrorCodes.noConnection :
            self = .unKnownError(message: "no connection")
        default :
            self = .unKnownError(message: message)
        }

    }
}

//MARK: enum constants

private enum ErrorCodes {
    static let unauthroized = "401"
    static let noConnection = "400"
}
