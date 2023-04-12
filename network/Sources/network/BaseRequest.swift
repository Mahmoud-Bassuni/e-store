//
//  File.swift
//  
//
//  Created by Ahmed Atef on 17/03/2023.
//

import Foundation
import Alamofire

public protocol Networkable {
    func request<T: Codable>(route: ServiceLayer, method: HTTPMethod, completion: @escaping (Result<T, RequestException>) -> Void)
}

public class BaseRequest: Networkable {
    public static let shared = BaseRequest()
    public func request<T: Codable>(route: ServiceLayer, method: HTTPMethod, completion: @escaping (Result<T, RequestException>) -> Void) {
        let headers = Alamofire.HTTPHeaders(route.headers ?? [:])
        let parameters = extractParameters(task: route.task)
        AF.request((route.baseUrl + route.path),
                   method : method,
                   parameters: parameters.params,
                   encoding:parameters.encoding,
                   headers: headers).responseString { response in
            guard let data = response.data else { return }
            switch response.result {
            case .success:
                do {
                    let jsonDecoded = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(jsonDecoded))
                    let loggerAttributes = LoggerBuilder().setLevel(level: .info)
                        .setMessage(message: "Success")
                        .setFile(file: #file)
                        .setFunction(function: #function)
                        .setLine(line: #line)
                        .setRequestUrl(responseUrl: "\(route.baseUrl + route.path)")
                        .setResponse(response: jsonDecoded)
                        .build()
                    Logger<T>.info(attributes: loggerAttributes)
                } catch(let error) {
                    completion(.failure(.invalidData))
                    let loggerAttributes = LoggerBuilder<T>().setLevel(level: .error)
                        .setMessage(message: "FAILURE")
                        .setFile(file: #file)
                        .setFunction(function: #function)
                        .setLine(line: #line)
                        .setRequestUrl(responseUrl: "\(route.baseUrl + route.path)")
                        .setError(error: error.localizedDescription)
                        .build()
                    Logger<T>.error(attributes: loggerAttributes)
                }
            case .failure(let error):
                completion(.failure(.unableToComplete))
                let loggerAttributes = LoggerBuilder<T>().setLevel(level: .error)
                    .setMessage(message: "FAILURE")
                    .setFile(file: #file)
                    .setFunction(function: #function)
                    .setLine(line: #line)
                    .setRequestUrl(responseUrl: "\(route.baseUrl + route.path)")
                    .setError(error: error.localizedDescription)
                    .build()
                Logger<T>.error(attributes: loggerAttributes)
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
