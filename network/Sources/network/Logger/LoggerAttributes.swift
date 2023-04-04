//
//  File.swift
//  
//
//  Created by Ahmed Atef on 04/04/2023.
//

import Foundation

struct LoggerAttributes<T: Codable> {
    let level: LogLevel
    let message: String
    let file: String
    let function: String
    let line: Int
    let responseUrl: String
    let response: T?
    let error: Error?
}
