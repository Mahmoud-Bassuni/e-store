//
//  File.swift
//  
//
//  Created by Hassan on 23/03/2023.
//

import Foundation
import network
public protocol UserRepositoryProtocol {
    func fetchUserCodable(completion: @escaping (Result<UserCodable, RequestException>) -> Void)
    func fetchUsersCodable(completion: @escaping (Result<[UserCodable], RequestException>) -> Void)
    func loginUser(loginInfo: (userName:String,passWord:String),completion: @escaping (Result<Token, RequestException>) -> Void)
}
public class UserRepository: UserRepositoryProtocol {
    public init() {
    }
    public required init(coder: NSCoder) {
    }
    public func fetchUserCodable(completion: @escaping (Result<UserCodable, RequestException>) -> Void) {
        let route = UserEndPoint.getSingleUser
        BaseRequest.shared.request(route: route, method: .get, completion: completion)
    }
    public func fetchUsersCodable(completion: @escaping (Result<[UserCodable], RequestException>) -> Void) {
        let route = UserEndPoint.getAllUsers
        BaseRequest.shared.request(route: route,method: .get, completion: completion)
    }
    public func loginUser(loginInfo: (userName:String,passWord:String),completion: @escaping (Result<Token, RequestException>) -> Void) {
        let route = UserEndPoint.loginUser(loginInfo.userName,loginInfo.passWord)
        BaseRequest.shared.request(route: route,method: .post ,completion: completion)
    }
}
