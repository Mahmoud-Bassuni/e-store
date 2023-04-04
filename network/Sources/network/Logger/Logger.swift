//
//  File.swift
//  
//
//  Created by Ahmed Atef on 22/03/2023.
//

import Foundation
public class Logger<T: Codable> {
    
    private static func logHandler<T: Codable>(attributes: LoggerAttributes<T>) {
         let buildedLogger = LoggerBuilder().set(level: attributes.level)
            .setMessage(message: attributes.message)
            .setFile(file: attributes.file)
            .setFunction(function: attributes.function)
            .setLine(line: attributes.line)
            .setResponse(response: attributes.response)
            .setError(error: attributes.error)
            .setResponseUrl(responseUrl: attributes.responseUrl)
            .build()
let description = "\(buildedLogger.level.level) File: \((buildedLogger.file as? NSString)?.lastPathComponent ?? #file) \(buildedLogger.message) Line : \(buildedLogger.line) URL : \(buildedLogger.responseUrl) Function: \(buildedLogger.function) Response : \(buildedLogger.response) Error : \(buildedLogger.error)"
#if DEBUG
        print(description)
#endif
    }
}
extension Logger {
    public static func info(attributes: LoggerAttributes<T>) {
        logHandler(attributes: attributes)
    }
    public static func warning(attributes: LoggerAttributes<T>) {
        logHandler(attributes: attributes)
    }
    public static func error(attributes: LoggerAttributes<T>) {
        logHandler(attributes: attributes)
    }
}
