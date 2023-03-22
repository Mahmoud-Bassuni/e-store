//
//  File.swift
//  
//
//  Created by Ahmed Atef on 17/03/2023.
//

import Foundation
import Alamofire

public protocol Networkable {
    func request<T: Decodable>(route: ServiceLayer, method: HTTPMethod, completion: @escaping (T?, Error?) -> Void)
}

public class BaseRequest: Networkable {
    public static let shared = BaseRequest()
    
    public func request<T: Decodable>(route: ServiceLayer, method: HTTPMethod, completion: @escaping (T?, Error?) -> Void)  {
      //  let method = Alamofire.HTTPMethod(rawValue: route.httpMethod.rawValue)
        let headers = Alamofire.HTTPHeaders(route.headers ?? [:])
        let parameters = extractParameters(task: route.task)
        
        AF.request(route.baseUrl + route.path, method : method, parameters: parameters.params, encoding: parameters.encoding, headers: headers).responseString { result in
            guard let data = result.data else { return }
            switch result.result {
            case .success(_):
                do {
                    let jsonDecoded = try JSONDecoder().decode(T.self, from: data)
                    completion(jsonDecoded,nil)
                }catch(let error) {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
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
