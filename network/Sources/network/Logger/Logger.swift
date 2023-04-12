//
//  File.swift
//  
//
//  Created by Ahmed Atef on 22/03/2023.
//

import Foundation
import UIKit
public class Logger<T: Codable> {
    
    private static func logHandler<T: Codable>(attributes: LoggerModel<T>) {
        let buildedLogger = LoggerBuilder().setLevel(level: attributes.level)
            .setMessage(message: attributes.message)
            .setFile(file: attributes.file)
            .setFunction(function: attributes.function)
            .setLine(line: attributes.line)
            .setResponse(response: attributes.response)
            .setError(error: attributes.error)
            .setRequestUrl(responseUrl: attributes.requestUrl)
            .build()
        let description = ""
#if DEBUG
        print(description)
#endif
    }
}
extension Logger {
    
    public static func info(attributes: LoggerModel<T>) {
        logHandler(attributes: attributes)
    }
    public static func warning(attributes: LoggerModel<T>) {
        logHandler(attributes: attributes)
    }
    public static func error(attributes: LoggerModel<T>) {
        logHandler(attributes: attributes)
    }
}
