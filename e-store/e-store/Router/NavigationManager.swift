//
//  NavigationManager.swift
//  e-store
//
//  Created by Ahmed Atef on 20/04/2023.
//

import Foundation
import UIKit

class NavigationManager {
    static let shared = NavigationManager()
    let navigation = UINavigationController(rootViewController: VerificationScreenViewController())
    private init() {}
}
