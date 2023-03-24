//
//  File.swift
//  
//
//  Created by Ahmed Atef on 17/03/2023.
//

import Foundation
import Alamofire

public enum Task {
    case plainRequest
    case requestWithParameters(parameters: [String: Any], encoding: ParameterEncoding)
}
