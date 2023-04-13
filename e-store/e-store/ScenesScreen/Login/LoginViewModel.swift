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
    private var username = ""
    private var password = ""
    private var checkButtonEable : (Bool) -> Void = { _ in }

    func updateButtonState() {

        let isEmailValid = !username.isEmpty
        let isPasswordValid = !password.isEmpty
        let isButtonEnable = isEmailValid && isPasswordValid
        checkButtonEable(isButtonEnable)
    }
}

// MARK: LoginViewModelInput
extension LoginViewModel: LoginViewModelInput {

    func updateEmail(email: String) {
        self.username = email
        updateButtonState()
    }
    
    func validUsername() -> Bool {
        Validator.isValidUsername(username: self.username)
    }

    func updatePassword(password: String) {
        self.password = password
        updateButtonState()
    }
    
    func validPassword() -> Bool {
        Validator.isValidPassword(password: self.password)
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
    
    func checkUser() {
        
        domain.login(loginInfo: (self.username, self.password)) { result in
            switch result {
            case .success(let token):
                print("Login successful, token: \(token)")
            case .failure(let error):
                print("Login failed, error: \(error)")
            }
        }
    }
}
