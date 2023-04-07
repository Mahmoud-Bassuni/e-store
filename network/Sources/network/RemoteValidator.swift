//
//  File.swift
//  
//
//  Created by Bassuni on 07/04/2023.
//

import Foundation

struct RemoteValidator {

    static func error(from response: Data) -> Error? {
        return try? JSONDecoder().decode(RemoteError.self, from: response)
    }
}
