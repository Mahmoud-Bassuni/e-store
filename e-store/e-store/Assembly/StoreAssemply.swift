//
//  StoreAssemply.swift
//  e-store
//
//  Created by Ahmed Atef on 04/04/2023.
//

import Foundation
import Swinject

class StoreAssemply: Assembly {
    
    // MARK: - Properties
    private let sharedContainer: Container
    // MARK: - Lifecycle
    init(sharedContainer: Container) {
        self.sharedContainer = sharedContainer
    }
    // MARK: - Functions
    func assemble(container: Swinject.Container) {
        sharedContainer.register(LoginViewModel.self) { _ in
            LoginViewModel()
        }
        sharedContainer.register(RegisterAccountViewModel.self) { _ in
            RegisterAccountViewModel()
        }
    }
}
