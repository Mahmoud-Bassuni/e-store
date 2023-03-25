//
//  LoginViewModel.swift
//  e-store
//
//  Created by Bassuni on 16/03/2023.
//
import Foundation
import Domain
// View -----> Action ----> ViewModel
// ViewModel -----> update ----> view
protocol LoginViewModelInput {
    func updateEmail(email: String)
    func updatePassword(password: String)
}

protocol LoginViewModelOutput {
    func checkConfigButton(callback: @escaping (Bool) -> Void)
}

// MARK: LoginViewModel
class LoginViewModel {
    private var domain = UserUseCase()
    private var email = ""
    private var password = ""
    private var checkButtonEable : (Bool) -> Void = { _ in }

    func updateButtonState() {

        let isEmailValid = !email.isEmpty
        let isPasswordValid = !password.isEmpty
        let isButtonEnable = isEmailValid && isPasswordValid
        checkButtonEable(isButtonEnable)
    }
}

// MARK: LoginViewModelInput
extension LoginViewModel: LoginViewModelInput {

    func updateEmail(email: String) {
        self.email = email
        updateButtonState()
    }
    
    func isValidEmail(_ email: String) -> Bool {
        guard !email.isEmpty, email.contains("@") else {
            return false
        }
        let emailParts = email.split(separator: "@")
        
        guard emailParts.count == 2 else {
            return false
        }
        let localPart = emailParts[0]
        guard !localPart.isEmpty else {
            return false
        }
        let domainPart = emailParts[1]
        guard domainPart.contains(".") else {
            return false
        }
        return true
    }
    
    func updatePassword(password: String) {
        self.password = password
        updateButtonState()
    }
    
    func isValidPassword(_ password: String) -> Bool {
        // Check that the password is at least 8 characters long
        guard password.count >= 8 else {
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
// MARK: LoginViewModelInput
extension LoginViewModel: LoginViewModelOutput {

    func checkConfigButton(callback: @escaping (Bool) -> Void) {
        self.checkButtonEable = callback
        self.updateButtonState()
    }
}
// MARK: get data from domain
extension LoginViewModel {
    func getSingleUser(completion: @escaping((User) -> Void)) {
        domain.fetchUserData { user in
            completion(user)
        }
    }
    func getAllUsers(completion:  @escaping (([User]) -> Void)) {
        domain.fetchUsersData { user in
            completion(user)
        }
    }
}
