//
//  File.swift
//  
//
//  Created by Ahmed Atef on 17/03/2023.
//

import Foundation
import Alamofire

public protocol Networkable {
    static func request<T: Codable>(route: ServiceLayer, method: HTTPMethod, completion: @escaping (Result<T, ApiError>) -> Void)
}

public class BaseRequest: Networkable {
    public static let shared = BaseRequest()
    public static func request<T: Codable>(route: ServiceLayer, method: HTTPMethod, completion: @escaping (Result<T, ApiError>) -> Void) {
        let headers = Alamofire.HTTPHeaders(route.headers ?? [:])
        let parameters = extractParameters(task: route.task)
        AF.request(route.baseUrl + route.path, method : method, parameters: parameters.params, encoding:parameters.encoding, headers: headers).responseString { response in
            ResponseHandler.handle(response: response, route: route, completion: completion)
        }
    }
    private static func extractParameters(task: Task) -> (params: [String: Any], encoding: ParameterEncoding) {
        switch task {
        case .plainRequest:
            return ([:], URLEncoding.default)
        case .requestWithParameters(let parameters, let encoding):
            return (parameters, encoding)
        }
    }
}
