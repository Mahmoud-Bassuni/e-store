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
            case 100...199: return ""
            case 200...299: return ""
            case 300...399: return ""
            case 400...499: return ""
            case 500...599: return ""
            default:
                return ""
            }
        }
    }
}
