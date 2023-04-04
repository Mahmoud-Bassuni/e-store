//
//  File.swift
//  
//
//  Created by Ahmed Atef on 04/04/2023.
//

import Foundation

public class LoggerBuilder<T: Codable> {
    
    // MARK: - Properties
    private var loggerAttributes: LoggerAttributes<T>
    // MARK: - Lifecycle
    init() {
        self.loggerAttributes = LoggerAttributes()
    }
    // MARK: - Functions
    func set(level: LogLevel) -> LoggerBuilder {
        loggerAttributes.level = level
        return self
    }
    func setMessage(message: String) -> LoggerBuilder {
        loggerAttributes.message = message
        return self
    }
    func setFile(file: String) -> LoggerBuilder {
        loggerAttributes.file = file
        return self
    }
    func setFunction(function: String) -> LoggerBuilder {
        loggerAttributes.function = function
        return self
    }
    func setLine(line: Int) -> LoggerBuilder {
        loggerAttributes.line = line
        return self
    }
    func setResponse(response: T) -> LoggerBuilder {
        loggerAttributes.response = response
        return self
    }
    func setError(error: String) -> LoggerBuilder {
        loggerAttributes.error = error
        return self
    }
    func setResponseUrl(responseUrl: String) -> LoggerBuilder {
        loggerAttributes.responseUrl = responseUrl
        return self
    }
    func build() -> LoggerAttributes<T> {
        self.loggerAttributes
    }
}
