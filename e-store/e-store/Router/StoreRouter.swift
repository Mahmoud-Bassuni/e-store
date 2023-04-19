//
//  StoreRouter.swift
//  e-store
//
//  Created by Ahmed Atef on 09/04/2023.
//

import UIKit
import Swinject

protocol StoreRouterProtocol {
    func showRegisterAccount() -> ViewControllerType
    func showVerification() -> ViewControllerType
    func showUsernameAndPassword() -> ViewControllerType
}

struct StoreRouter : StoreRouterProtocol {
    static let shared = StoreRouter()
    private let appManager = DependencyManager.shared
    private let resolver : Resolver
    init() {
        appManager.setupAssemplers()
        resolver = appManager.sharedContainer
    }
    func showRegisterAccount() -> ViewControllerType {
        let viewModel = resolver.resolve(RegisterAccountViewModel.self)
        return RegisterAccountScreenViewController(registerViewModel: viewModel ?? RegisterAccountViewModel())
    }
     func showVerification() -> ViewControllerType {
         let verificationViewModel = resolver.resolve(VerificationViewModel.self)
        return VerificationScreenViewController(verificationViewModel: verificationViewModel ?? VerificationViewModel())
    }
    func showUsernameAndPassword() -> ViewControllerType {
        let setUserNameAndPasswordViewModel = resolver.resolve(SetUserNameAndPasswordViewModel.self)
       return SetUserNameAndPasswordViewController(setUserNameAndPasswordViewModel: setUserNameAndPasswordViewModel ?? SetUserNameAndPasswordViewModel() )
    }
}
