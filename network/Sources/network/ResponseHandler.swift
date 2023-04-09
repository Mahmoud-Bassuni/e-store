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
                completion(.failure(.detectError(statusCode: response.response?.statusCode ?? 400)))
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
            completion(.failure(.detectError(statusCode: response.response?.statusCode ?? 400)))
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
