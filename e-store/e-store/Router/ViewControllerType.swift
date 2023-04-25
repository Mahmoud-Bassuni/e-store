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
    func present(viewToPresent: ViewControllerType, animated: Bool, completion: (() -> Void)?)
    func dismissView(animated: Bool, completion: (() -> Void)?)
}

extension UIViewController: ViewControllerType {
     
    func push(viewController: ViewControllerType, animated: Bool = true) {
        guard let viewController = viewController as? UIViewController else {return}
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func pop(animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }
    
    func popToRoot(animated: Bool = true) {
        navigationController?.popToRootViewController(animated: animated)
    }
    
    func present(viewToPresent: ViewControllerType, animated: Bool = true, completion: (() -> Void)? = {}) {
        self.present( (viewToPresent as! UIViewController), animated: animated, completion: completion)
    }
    
    func dismissView(animated: Bool = true, completion: (() -> Void)? = {}) {
        self.dismiss(animated: animated, completion: completion)
    }
}
