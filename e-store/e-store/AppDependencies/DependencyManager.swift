//
//  DependencyManager.swift
//  e-store
//
//  Created by Ahmed Atef on 04/04/2023.
//

import Foundation
import Swinject

class DependencyManager {
    
    // MARK: - Properties
    let sharedContainer: Container
    private var soreAssempler: Assembler!
    // MARK: - Lifecycle
    init(sharedContainer: Container) {
        self.sharedContainer = sharedContainer
    }
    // MARK: - Functions
    func setupAssemplers() {
        soreAssempler = Assembler([StoreAssemply(sharedContainer: sharedContainer)])
    }
}
