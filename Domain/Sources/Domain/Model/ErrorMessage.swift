//
//  File.swift
//  
//
//  Created by Ahmed Atef on 20/04/2023.
//

import Foundation

public class ErrorMessage: Error {
    
    public var description: String
    init(description: String) {
        self.description = description
    }
}
