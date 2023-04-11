//
//  File.swift
//  
//
//  Created by Ahmed Atef on 23/03/2023.
//

import Foundation

public enum ApiError: Error {
    case detectError(statusCode: Int)
    var description: String {
        switch self {
        case .detectError(let statusCode):
            switch statusCode {
            case 100...199: return "Server has received the request and is continuing to process it."
            case 200...299: return "Server has successfully received, understood, and accepted the request."
            case 300...399: return "Further action needs to be taken by the client to complete the request."
            case 400...499: return "Client's request was invalid or could not be processed by the server."
            case 500...599: return "server failed to fulfill a valid request."
            default:
                return "Some thing went wrong!"
            }
        }
    }
}
