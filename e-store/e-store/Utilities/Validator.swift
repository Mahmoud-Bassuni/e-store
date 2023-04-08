//
//  Validator.swift
//  e-store
//
//  Created by Zeyad on 02/04/2023.
//

import Foundation

//MARK: Validate Username and Password
public class Validator {
    
    static func isValidUsername(username: String) -> Bool {
        //requires the username to contain only letters (uppercase and lowercase), digits, underscores, dashes, and dots, and is at least 3 characters long, with at least one uppercase and one lowercase letter
        let usernameRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])[a-zA-Z0-9._-]{3,}$"
            if let range = username.range(of: usernameRegex, options: .regularExpression) {
                return username.distance(from: username.startIndex, to: range.lowerBound) == 0 &&
                       username.distance(from: username.startIndex, to: range.upperBound) == username.count
            }
            return false
    }
    static func isValidPassword(password: String) -> Bool {
        // Check that the password is at least 6 characters long
        guard password.count >= 6 else {
            return false
        }
        // Check that the password contains at least one letter and one digit
        let letterCharacterSet = CharacterSet.letters
        let digitCharacterSet = CharacterSet.decimalDigits
        let hasLetter = password.rangeOfCharacter(from: letterCharacterSet) != nil
        let hasDigit = password.rangeOfCharacter(from: digitCharacterSet) != nil
        return hasLetter && hasDigit
    }
}
