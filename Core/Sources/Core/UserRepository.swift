//
//  File.swift
//  
//
//  Created by A1softech on 16/03/2023.
//

import Foundation
import network
import Alamofire
public protocol UserRepositoryProtocol {
    func fetchUserCodable(completion:  @escaping (UserCodable?,Error?) -> Void)
    func fetchUsersCodable(completion:  @escaping ([UserCodable]?,Error?) -> Void)
    func loginUser(loginInfo: (userName:String,passWord:String),completion: @escaping (Token?,Error?) -> Void)
}
public class UserRepository: UserRepositoryProtocol {
    public init() {
    }
    public required init(coder: NSCoder) {
    }
    public func loginUser(loginInfo: (userName:String,passWord:String), completion: @escaping (Token?, Error?) -> Void) {
        let route = UserEndPoint.loginUser(loginInfo.userName,loginInfo.passWord)
        BaseRequest.shared.request(route: route, completion: completion)
        }
    public func fetchUserCodable(completion:  @escaping (UserCodable?,Error?) -> Void) {
            let route = UserEndPoint.getSingleUser
            BaseRequest.shared.request(route: route, completion: completion)
    }
    public func fetchUsersCodable(completion:  @escaping ([UserCodable]?,Error?) -> Void) {
            let route = UserEndPoint.getAllUsers
            BaseRequest.shared.request(route: route, completion: completion)
    }
}
