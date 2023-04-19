//
//  Validator.swift
//  e-store
//
//  Created by Zeyad on 02/04/2023.
//

import Foundation

// MARK: Validate Username and Password
public class Validator {
    
    static func isValidUsername(username: String) -> Bool {
        
        let usernameRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])[a-zA-Z0-9._-]{3,}$"
        if let range = username.range(of: usernameRegex, options: .regularExpression) {
            print(range)
            return username.distance(
                from: username.startIndex,
                to: range.lowerBound) == 0 &&
            username.distance(
                from: username.startIndex,
                to: range.upperBound) == username.count
        }
        return false
    }
    static func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        if let range = email.range(of: emailRegex, options: .regularExpression) {
            return email.distance(from: email.startIndex, to: range.lowerBound) == 0 &&
                email.distance(from: email.startIndex, to: range.upperBound) == email.count
        }
        return false
    }
    static func isValidFullName(fullName: String) -> Bool {
        let fullNameRegex = #"^([a-zA-Z]+\s{1}[a-zA-Z]+)$"#
        return fullName.range(of: fullNameRegex, options: .regularExpression) != nil
    }

    static func isValidPhoneNumber(phoneNumber: String) -> Bool {
        let phoneNumberRegex = "^01[0125][0-9]{8}$"
        if let range = phoneNumber.range(of: phoneNumberRegex, options: .regularExpression) {
            return phoneNumber.distance(from: phoneNumber.startIndex, to: range.lowerBound) == 0 &&
                phoneNumber.distance(from: phoneNumber.startIndex, to: range.upperBound) == phoneNumber.count
        }
        return false
    }
    static func hasOneDigit(input: String) -> Bool {
        let digitRegex = "^[0-9]{1}$"
        return input.range(of: digitRegex, options: .regularExpression) != nil
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
