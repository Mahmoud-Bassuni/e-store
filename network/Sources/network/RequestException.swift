//
//  File.swift
//  
//
//  Created by Ahmed Atef on 23/03/2023.
//

import Foundation

public enum RequestException: String, Error {
    case unableToComplete = "Unable to complete your request"
    case invalidData  = "The data recieved from server was invalid "
}
