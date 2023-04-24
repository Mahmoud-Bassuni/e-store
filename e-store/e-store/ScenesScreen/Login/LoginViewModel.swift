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
    func validUsername() -> Bool
    func validPassword() -> Bool
    func checkUser(completion:@escaping (LoginMessage) -> Void)
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

    func updatePassword(password: String) {
        self.password = password
        updateButtonState()
    }
    
}
// MARK: LoginViewModelInput
extension LoginViewModel: LoginViewModelOutput {

    func checkConfigButton(callback: @escaping (Bool) -> Void) {
        self.checkButtonEable = callback
        self.updateButtonState()
    }
    
    func validUsername() -> Bool {
        Validator.isValidUsername(username: self.username)
    }
    
    func validPassword() -> Bool {
        Validator.isValidPassword(password: self.password)
    }
}
// MARK: get data from domain
extension LoginViewModel {
    
    func checkUser(completion:@escaping (LoginMessage) -> Void) {
        let checkUsernameAndPassword = checkUsernameAndPassword()
        if(!checkUsernameAndPassword) {
            completion(.validateError)
        } else {
            domain.login(loginInfo: (self.username, self.password)) { result in
                switch result {
                case .success(let token):
                    print("Login successful, token: \(token)")
                    completion(.success)
                case .failure(let error):
                    print("Login failed, error: \(error)")
                    completion(.failure(error.description))
                }
            }
        }
    }
}



extension LoginViewModel {
    
    func checkUsernameAndPassword() -> Bool {
        let emailValid :Bool = validUsername()
        let passwordValid :Bool = validPassword()
        if( (emailValid && passwordValid) == false) {
            return false
       }
        return true
    }
}
