//
//  File.swift
//  
//
//  Created by Ahmed Atef on 17/03/2023.
//

import Foundation
import Alamofire

public protocol Networkable {
    func request<T: Codable>(route: ServiceLayer, method: HTTPMethod, completion: @escaping (T?, Error?) -> Void)
}

public class BaseRequest: Networkable {
    public static let shared = BaseRequest()
    public func request<T: Codable>(route: ServiceLayer, method: HTTPMethod, completion: @escaping (T?, Error?) -> Void) {
        let headers = Alamofire.HTTPHeaders(route.headers ?? [:])
        let parameters = extractParameters(task: route.task)
        AF.request(route.baseUrl + route.path, method : method, parameters: parameters.params, encoding: parameters.encoding, headers: headers).responseString { response in
            guard let data = response.data else { return }
            switch response.result {
            case .success:
                do {
                    let jsonDecoded = try JSONDecoder().decode(T.self, from: data)
                    completion(jsonDecoded,nil)
                    Logger<T>.info(message: "SUCCESS", responseUrl: "\(route.baseUrl + route.path)", response: jsonDecoded, error: nil)
                } catch(let error) {
                    completion(nil, error)
                    Logger<T>.error(message: "SOME ERROR OCCURRED", responseUrl: "\(route.baseUrl + route.path)", response: nil, error: error)
                }
            case .failure(let error):
                completion(nil, error)
                Logger<T>.error(message: "FAILURE", responseUrl: "\(route.baseUrl + route.path)", response: nil, error: error)
            }
        }
    }
    
    private func extractParameters(task: Task) -> (params: [String: Any], encoding: ParameterEncoding) {
        switch task {
        case .plainRequest:
            return ([:], URLEncoding.default)
        case .requestWithParameters(let parameters, let encoding):
            return (parameters, encoding)
        }
    }
}
