//
//  LoginViewModel.swift
//  e-store
//
//  Created by Zeyad on 27/03/2023.
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
    func isValidUsername(_ username: String) -> Bool {
        let allowedCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789._-")
        let usernameCharacterSet = CharacterSet(charactersIn: username)
        return allowedCharacters.isSuperset(of: usernameCharacterSet) && username.count >= 3
    }

    func updatePassword(password: String) {
        self.password = password
        updateButtonState()
    }
    func isValidPassword(_ password: String) -> Bool {
        // Check that the password is at least 8 characters long
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
    func checkUser(username: String, password:String, completion: @escaping((Bool) -> Void)) {
        domain.login(loginInfo: (username, password)) { token in
            if let token {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
