//
//  File.swift
//  
//
//  Created by A1softech on 18/03/2023.
//

import Foundation
import Alamofire
public enum UserEndPoint: ServiceLayer {
  case getSingleUser
  case getAllUsers
    case loginUser(String , String)
    public  var path: String {
        switch self {
        case .getSingleUser:
            return "/users/1"
        case .getAllUsers:
            return "/users"
        case .loginUser:
            return "/auth/login"
        }
    }
    public var httpMethod: HttpMethod {
        switch self {
        case .getSingleUser:
            return .gett
        case .getAllUsers:
              return  .gett
        case .loginUser:
            return .post
        }
    }
    public var task: Task {
        switch self {
        case .getSingleUser:
            return .plainRequest
        case .getAllUsers:
            return .plainRequest
        case .loginUser(let username,let passWord):
            return .requestWithParameters(parameters: ["username": username, "password": passWord], encoding: URLEncoding.default)
        }
    }
    public var headers: [String: String]? {
    return nil
    }
}
