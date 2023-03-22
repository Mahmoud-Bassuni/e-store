//
//  File.swift
//  
//
//  Created by Ahmed Atef on 22/03/2023.
//

import Foundation
enum LogLevel {
    case info
    case warning
    case error
    
    var level: String {
        switch self {
        case .info:    return "INFO"
        case .warning: return "WARN ⚠️"
        case .error:   return "ERROR ❌"
        }
    }
}
