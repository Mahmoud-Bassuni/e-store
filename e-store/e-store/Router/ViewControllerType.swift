//
//  BaseRouter.swift
//  e-store
//
//  Created by Ahmed Atef on 08/04/2023.
//

import Foundation
import UIKit

protocol ViewControllerType {
    func push(_ viewToPresent: ViewControllerType, animated: Bool)
    func pop(animated: Bool)
    func present(_ viewToPresent: ViewControllerType, animated: Bool, completion: (() -> Void)?)
    func dismissView(animated: Bool, completion: (() -> Void)?)
    func popToRoot(animated: Bool)
    var navigationController: UINavigationController { get }
}
extension UIViewController: ViewControllerType {
    
    var navigationController: UINavigationController {
        UINavigationController()
    }
    
    func push(_ viewToPresent: ViewControllerType, animated: Bool = true) {
        //guard let nav = (self as? UINavigationController) ?? self.navigationController else { return }
        guard let viewToPresent = viewToPresent as? UIViewController else {return}
        navigationController.pushViewController(viewToPresent, animated: animated)
    }
    
    func pop(animated: Bool) {
        navigationController.popViewController(animated: animated)
    }
    
    func present(_ viewToPresent: ViewControllerType, animated: Bool, completion: (() -> Void)?) {
        guard let viewToPresent = viewToPresent as? UIViewController else {return}
        self.present(viewToPresent, animated: true, completion: completion)
    }
    
    func dismissView(animated: Bool, completion: (() -> Void)?) {
        self.dismiss(animated: true, completion: completion)
        
    }
    
    func popToRoot(animated: Bool) {
        navigationController.popToRootViewController(animated: animated)
    }
}
