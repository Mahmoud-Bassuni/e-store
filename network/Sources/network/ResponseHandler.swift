//
//  File.swift
//  
//
//  Created by Ahmed Atef on 09/04/2023.
//

import Foundation
import Alamofire

class ResponseHandler<T: Codable> {
    static func handle(response: AFDataResponse<String>, route: ServiceLayer, completion: @escaping (Result<T, ApiError>) -> Void) {
        switch response.result {
        case .success:
            handleSuccessState(response: response, route: route, completion: completion)
        case .failure:
            handleFailureState(response: response, route: route, completion: completion)
        }
    }
    
    private static func handleSuccessState(response: AFDataResponse<String>, route: ServiceLayer, completion: @escaping (Result<T, ApiError>) -> Void) {
        guard let data = response.data else { return }

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
        } catch {
            completion(.failure(.detectError(statusCode: response.response?.statusCode ?? 400)))
            let loggerAttributes = LoggerBuilder<T>().setLevel(level: .error)
                .setMessage(message: "FAILURE")
                .setFile(file: #file)
                .setFunction(function: #function)
                .setLine(line: #line)
                .setRequestUrl(responseUrl: "\(route.baseUrl + route.path)")
                .setError(error: ApiError.detectError(statusCode: response.response?.statusCode ?? 400).description)
                .build()
            Logger<T>.error(attributes: loggerAttributes)
        }
    }
    
    private static func handleFailureState(response: AFDataResponse<String>, route: ServiceLayer, completion: @escaping (Result<T, ApiError>) -> Void) {
        completion(.failure(.detectError(statusCode: response.response?.statusCode ?? 400)))
        let loggerAttributes = LoggerBuilder<T>().setLevel(level: .error)
            .setMessage(message: "FAILURE")
            .setFile(file: #file)
            .setFunction(function: #function)
            .setLine(line: #line)
            .setRequestUrl(responseUrl: "\(route.baseUrl + route.path)")
            .setError(error: ApiError.detectError(statusCode: response.response?.statusCode ?? 400).description)
            .build()
        Logger<T>.error(attributes: loggerAttributes)
        
    }
}
