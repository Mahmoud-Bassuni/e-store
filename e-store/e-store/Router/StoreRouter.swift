//
//  StoreRouter.swift
//  e-store
//
//  Created by Ahmed Atef on 08/04/2023.
//

import Foundation
import Swinject
import UIKit

protocol StoreRouterProtocol {
    func showLogin() -> BaseRouter
}

class StoreRouter: StoreRouterProtocol, BaseRouter {
    var navigationController: UINavigationController {
        UINavigationController()
    }
    private var resolver: Resolver
    init(resolver: Resolver) {
        self.resolver = resolver
    }
//    func showLogin() -> BaseRouter {
//        let viewModel = (resolver.resolve(LoginViewModel.self)) ?? LoginViewModel()
//        return ViewController()
//    }
}



