//
//  File.swift
//  
//
//  Created by Ahmed Atef on 04/04/2023.
//

import Foundation

public struct LoggerModel<T: Codable>: Error {
    
    var level: LogLevel = .info
    var message: String = ""
    var file: String = ""
    var function: String = ""
    var line: Int = 0
    var requestUrl: String = ""
    var response: T?
    var error: String = ""
}
