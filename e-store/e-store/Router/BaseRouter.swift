//
//  BaseRouter.swift
//  e-store
//
//  Created by Ahmed Atef on 08/04/2023.
//

import Foundation
import UIKit

protocol BaseRouter {
    func push(_ viewToPresent: BaseRouter, animated: Bool)
    func pop(animated: Bool)
    func present(_ viewToPresent: BaseRouter, animated: Bool, completion: (() -> Void)?)
    func dismiss(animated: Bool, completion: (() -> Void)?)
    func popToRoot(animated: Bool)
    var navigationController: UINavigationController { get }
}
extension BaseRouter {
    func push(_ viewToPresent: BaseRouter, animated: Bool = true) {
        guard let viewToPresent = viewToPresent as? UIViewController else {return}
        navigationController.pushViewController(viewToPresent, animated: true)
    }
    
    func pop(animated: Bool) {
        navigationController.popViewController(animated: animated)
    }
    
    func present(_ viewToPresent: BaseRouter, animated: Bool, completion: (() -> Void)?) {
        guard let viewToPresent = viewToPresent as? UIViewController else {return}
        navigationController.present(viewToPresent, animated: true, completion: completion)
    }
    
    func dismiss(animated: Bool, completion: (() -> Void)?) {
        navigationController.dismiss(animated: animated, completion: completion)
    }
    
    func popToRoot(animated: Bool) {
        navigationController.popToRootViewController(animated: animated)
    }
}
