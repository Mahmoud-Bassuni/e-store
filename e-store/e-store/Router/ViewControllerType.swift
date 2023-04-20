//
//  ViewControllerType.swift
//  e-store
//
//  Created by Ahmed Atef on 09/04/2023.
//

import Foundation
import UIKit
protocol ViewControllerType {
    func push(viewController: ViewControllerType, animated: Bool)
    func pop(animated: Bool)
    func popToRoot(animated: Bool)
    func presentView(viewToPresent: ViewControllerType, animated: Bool, completion: (() -> Void)?)
    func dismissView(animated: Bool, completion: (() -> Void)?)
}

extension UIViewController: ViewControllerType {
    
    func push(viewController: ViewControllerType, animated: Bool = true) {
        guard let viewController = viewController as? UIViewController else {return}
        NavigationManager.shared.navigation.pushViewController(viewController, animated: animated)
    }
    
    func pop(animated: Bool = true) {
        NavigationManager.shared.navigation.popViewController(animated: animated)
    }

    func popToRoot(animated: Bool = true) {
        NavigationManager.shared.navigation.popToRootViewController(animated: animated)
    }
    
    func presentView(viewToPresent: ViewControllerType, animated: Bool = true, completion: (() -> Void)? = {}) {
        guard let viewToPresent = viewToPresent as? UIViewController else {return}
        self.present(viewToPresent, animated: animated, completion: completion)
    }
    
    func dismissView(animated: Bool = true, completion: (() -> Void)? = {}) {
        self.dismiss(animated: animated, completion: completion)
    }
}
