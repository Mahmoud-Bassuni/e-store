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
        guard let viewModel = resolver.resolve(RegisterAccountViewModel.self)else {
            fatalError("error resolve RegisterAccountViewModel")
        }
        return RegisterAccountScreenViewController(registerViewModel: viewModel )
    }
     func showVerification() -> ViewControllerType {
         guard let verificationViewModel = resolver.resolve(VerificationViewModel.self) else {
             fatalError("error resolve VerificationViewModel")
         }
         return VerificationScreenViewController(verificationViewModel: verificationViewModel )
    }
    func showUsernameAndPassword() -> ViewControllerType {
       guard let setUserNameAndPasswordViewModel = resolver.resolve(SetUserNameAndPasswordViewModel.self)else {
            fatalError("error resolve SetUserNameAndPasswordViewModel")
        }
       return SetUserNameAndPasswordViewController(setUserNameAndPasswordViewModel: setUserNameAndPasswordViewModel  )
    }
}
