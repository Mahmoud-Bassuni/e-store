//
//  LoginViewModel.swift
//  e-store
//
//  Created by Zeyad on 27/03/2023.
//
import Foundation
import Domain

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
    func validUsername(_ username: String) -> Bool {
        Validator.isValidUsername(username: username)
    }

    func updatePassword(password: String) {
        self.password = password
        updateButtonState()
    }
    func validPassword(_ password: String) -> Bool {
        Validator.isValidPassword(password: password)
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
    
    func checkUser(username: String, password:String) {
        domain.login(loginInfo: (username, password)) { result in
            switch result {
            case .success(let token):
                print("Login successful, token: \(token)")
            case .failure(let error):
                print("Login failed, error: \(error)")
            }
        }
    }
}
