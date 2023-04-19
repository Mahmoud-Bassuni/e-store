//
//  File.swift
//  
//
//  Created by Hassan on 23/03/2023.
//

import Foundation
import Alamofire
import network
public enum UserEndPoint: ServiceLayer {
    case loginUser(String , String)
    
    public  var path: String {
        switch self {
        case .loginUser:
            return "/auth/login"
        }
    }
    public var task: Task {
        switch self {
        case .loginUser(let username,let passWord):
            return .requestWithParameters(parameters: ["username": username, "password": passWord],
                                          encoding: URLEncoding.default)
        }
    }
    public var headers: [String: String]? {
        return nil
    }
}
