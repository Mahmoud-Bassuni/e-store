//
//  StoreRouter.swift
//  e-store
//
//  Created by Ahmed Atef on 09/04/2023.
//

import Foundation

import Swinject

protocol StoreRouterProtocol {
    func showRegisterAccount(viewController: ViewControllerType)
    func showVerification(viewController: ViewControllerType)
    func showUsernameAndPassword(viewController: ViewControllerType)
    func popToRoot(viewController: ViewControllerType)
}

struct StoreRouter : StoreRouterProtocol {
    private let resolver : Resolver
   
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func showRegisterAccount(viewController: ViewControllerType) {
        guard let viewModel = resolver.resolve(RegisterAccountViewModel.self)else { return }
        let viewCont =  RegisterAccountScreenViewController(registerViewModel: viewModel )
        viewController.push(viewController: viewCont , animated: true)
    }
    func showVerification(viewController: ViewControllerType) {
        guard let verificationViewModel = resolver.resolve(VerificationViewModel.self) else {
            return         }
        let viewCont =  VerificationScreenViewController(verificationViewModel: verificationViewModel )
        
        viewController.push(viewController: viewCont, animated: true)
        
    }
    func showUsernameAndPassword(viewController: ViewControllerType) {
        guard let setUserNameAndPasswordViewModel = resolver.resolve(SetUserNameAndPasswordViewModel.self)else { return }
        let viewCont = SetUserNameAndPasswordViewController(
            setUserNameAndPasswordViewModel: setUserNameAndPasswordViewModel  )
        viewController.push(viewController: viewCont, animated: true)
    }
    func popToRoot(viewController: ViewControllerType){
        viewController.popToRoot(animated: true)
    }

}
