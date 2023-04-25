//
//  AppRouter.swift
//  e-store
//
//  Created by Hassan on 25/04/2023.
//

import UIKit
import Swinject
protocol AppRouterProtocol {
    func startJourny(window: UIWindow)
    
}

struct AppRouter : AppRouterProtocol {
    
    private let resolver : Resolver
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    func startJourny(window: UIWindow) {
        guard let viewModel = resolver.resolve(RegisterAccountViewModel.self)else { return }
        let viewController =  RegisterAccountScreenViewController(registerViewModel: viewModel )
        window.rootViewController = UINavigationController(rootViewController: viewController)
        window.makeKeyAndVisible()
    }
   
}
