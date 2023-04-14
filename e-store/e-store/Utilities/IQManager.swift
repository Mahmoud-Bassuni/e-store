//
//  IQManager.swift
//  e-store
//
//  Created by Hassan on 13/04/2023.
//

import Foundation
import IQKeyboardManagerSwift

class IQManager {
    
    static func setup(){
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
    }
    
}
