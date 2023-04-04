//
//  File.swift
//  
//
//  Created by Ahmed Atef on 04/04/2023.
//

import Foundation

public class LoggerBuilder<T: Codable> {
    
    private var loggerAttributes: LoggerAttributes<T>
    init() {
        self.loggerAttributes = LoggerAttributes()
    }
    
    func set(level: LogLevel) -> LoggerBuilder {
        loggerAttributes.level = level
        return self
    }
    func set(message: String) -> LoggerBuilder {
        loggerAttributes.message = message
        return self
    }
    func set(file: String) -> LoggerBuilder {
        loggerAttributes.file = file
        return self
    }
    func set(function: String) -> LoggerBuilder {
        loggerAttributes.function = function
        return self
    }
    func set(line: Int) -> LoggerBuilder {
        loggerAttributes.line = line
        return self
    }
    func set(response: T) -> LoggerBuilder {
        loggerAttributes.response = response
        return self
    }
    func set(error: Error) -> LoggerBuilder {
        loggerAttributes.error = error
        return self
    }
    func set(responseUrl: String) -> LoggerBuilder {
        loggerAttributes.responseUrl = responseUrl
        return self
    }
    
    func build() -> LoggerAttributes<T> {
        self.loggerAttributes
    }
    
}
