//
//  File.swift
//  
//
//  Created by Ahmed Atef on 23/03/2023.
//

import Foundation

public enum RemoteError: Error {
    case detectError(statusCode: Int)
    public var description: String {
        switch self {
        case .detectError(let statusCode):
           return chooseFromCommonErrors(statusCode: statusCode)
        }
    }
    
   private func chooseFromCommonErrors(statusCode: Int) -> String {
        switch statusCode {
        case 200: return "Request succeeded"
        case 201: return "Created"
        case 204: return "No content to send"
        case 300: return "Multiple choices available, please choose one"
        case 301: return "Resource has been permanently moved to new resource URL"
        case 304: return "Resource has not been modified since last request"
        case 400: return "Request syntax is invalid"
        case 401: return "Authentication failed, please provide valid credentials"
        case 403: return "Access to resource is forbidden"
        case 404: return "Resource not found"
        case 500: return "Internal server error, please try again later"
        case 502: return "Bad gateway, upstream server returned an invalid response"
        case 503: return "Service is currently unavailable, please try again later"
        default:
            return "Some thing went wrong!"

        }
    }
}
