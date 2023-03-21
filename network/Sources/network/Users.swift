//
//  File.swift
//  
//
//  Created by A1softech on 18/03/2023.
//

import Foundation
public enum UserEndPoint: ServiceLayer {
  case getSingleUser
    case getAllUsers
    public  var path: String {
        switch self {
        case .getSingleUser:
            return "/users/1"
        case .getAllUsers:
            return "/users"
        }
    }
    public var httpMethod: HttpMethod {
        switch self {
        case .getSingleUser:
            return .gett
        case .getAllUsers:
              return  .gett
        }
    }
    public var task: Task {
        switch self {
        case .getSingleUser:
            return .plainRequest
        case .getAllUsers:
            return .plainRequest
        }
    }
    public var headers: [String: String]? {
    return nil
    }
}
