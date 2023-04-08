//
//  File.swift
//  
//
//  Created by Ahmed Atef on 04/04/2023.
//

import Foundation

public class LoggerBuilder<T: Codable> {
    
    // MARK: - Properties
    private var loggerAttributes: LoggerModel<T>
    // MARK: - Lifecycle
    init() {
        self.loggerAttributes = LoggerModel()
    }
    // MARK: - Functions
    @discardableResult
    func setLevel(level: LogLevel) -> LoggerBuilder {
        loggerAttributes.level = level
        return self
    }
    
    @discardableResult
    func setMessage(message: String) -> LoggerBuilder {
        loggerAttributes.message = message
        return self
    }
    
    @discardableResult
    func setFile(file: String) -> LoggerBuilder {
        loggerAttributes.file = file
        return self
    }
    
    @discardableResult
    func setFunction(function: String) -> LoggerBuilder {
        loggerAttributes.function = function
        return self
    }
    
    @discardableResult
    func setLine(line: Int) -> LoggerBuilder {
        loggerAttributes.line = line
        return self
    }
    
    @discardableResult
    func setResponse(response: T) -> LoggerBuilder {
        loggerAttributes.response = response
        return self
    }
    
    @discardableResult
    func setError(error: String) -> LoggerBuilder {
        loggerAttributes.error = error
        return self
    }
    
    @discardableResult
    func setRequestUrl(responseUrl: String) -> LoggerBuilder {
        loggerAttributes.requestUrl = responseUrl
        return self
    }
    
    func build() -> LoggerModel<T> {
        self.loggerAttributes
    }
}
