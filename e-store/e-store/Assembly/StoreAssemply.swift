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
        sharedContainer.register(AppRouterProtocol.self) { resolver in
            AppRouter(resolver: resolver)
        }
        sharedContainer.register(StoreRouterProtocol.self) { resolver in
            StoreRouter(resolver: resolver)
        }
        sharedContainer.register(LoginViewModel.self) { resolver in
            LoginViewModel(storeRouter: StoreRouter(resolver: resolver))
        }
        sharedContainer.register(RegisterAccountViewModel.self) { resolver in
            RegisterAccountViewModel(storeRouter: StoreRouter(resolver: resolver))
        }
        sharedContainer.register(VerificationViewModel.self) { resolver in
            VerificationViewModel(storeRouter: StoreRouter(resolver: resolver))
        }
        sharedContainer.register(SetUserNameAndPasswordViewModel.self) { resolver in
            SetUserNameAndPasswordViewModel(storeRouter: StoreRouter(resolver: resolver))
        }
        sharedContainer.register(ItemsViewModel.self) { _ in
            ItemsViewModel()
        }
    }
}
