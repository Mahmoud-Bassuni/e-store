//
//  File.swift
//  
//
//  Created by Ahmed Atef on 04/04/2023.
//

import Foundation

public struct LoggerAttributes<T: Codable>: Error {
    var level: LogLevel?
    var message: String?
    var file: String? 
    var function: String?
    var line: Int?
    var responseUrl: String?
    var response: T?
    var error: Error?
}

