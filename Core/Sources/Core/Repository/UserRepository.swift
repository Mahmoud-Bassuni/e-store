//
//  File.swift
//  
//
//  Created by Hassan on 23/03/2023.
//

import Foundation
import network
public protocol UserRepositoryProtocol {
    func loginUser(loginInfo: (userName:String,passWord:String),completion: @escaping (Result<Auth, RequestException>) -> Void)
}
public class UserRepository: UserRepositoryProtocol {
    public init() {
    }
    public required init(coder: NSCoder) {
    }
    public func loginUser(loginInfo: (userName:String,passWord:String),completion: @escaping (Result<Auth, RequestException>) -> Void) {
        let route = UserEndPoint.loginUser(loginInfo.userName,loginInfo.passWord)
        BaseRequest.shared.request(route: route,method: .post ,completion: completion)
    }
}
