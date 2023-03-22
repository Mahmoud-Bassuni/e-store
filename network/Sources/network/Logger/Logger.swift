//
//  File.swift
//  
//
//  Created by Ahmed Atef on 22/03/2023.
//

import Foundation
public class Logger<T: Codable> {
    private static func logHandler<T: Codable>(level: LogLevel,
                                               message: String,
                                               file: String,
                                               function: String,
                                               line: Int,
                                               responseUrl: String,
                                               response: T?,
                                               error: Error?) {
        let description = "\(level.level) \(message) Line : \(line) URL : \(responseUrl) Function: \(function) Response : \(response) Error : \(error)"
        #if DEBUG
        print(description)
        #endif
    }
    }
extension Logger {
    public static func info(message: String,
                            file: String = (#file as NSString).lastPathComponent,
                            function: String = #function,
                            line: Int = #line,
                            responseUrl: String,
                            response: T? = nil,
                            error: Error?) {
        logHandler(level: .info, message: message, file: file, function: function, line: line, responseUrl: responseUrl, response: response, error: error)
    }
    public static func warning(message: String,
                               file: String = (#file as NSString).lastPathComponent,
                               function: String = #function,
                               line: Int = #line,
                               responseUrl: String,
                               response: T?,
                               error: Error?) {
        logHandler(level: .warning, message: message, file: file, function: function, line: line, responseUrl: responseUrl, response: response, error: error)
    }
    public static func error(message: String,
                             file: String = (#file as NSString).lastPathComponent,
                             function: String = #function,
                             line: Int = #line,
                             responseUrl: String,
                             response: T?,
                             error: Error?) {
        logHandler(level: .error, message: message, file: file, function: function, line: line, responseUrl: responseUrl, response: response, error: error)
    }
}
