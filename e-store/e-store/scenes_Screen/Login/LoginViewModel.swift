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
    private var user = FetchUserUseCase()
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
}
// MARK: get data from domain
extension LoginViewModel {
    func getdata() -> (email: String, id: Int) {
        var user1 = User(id: 0, email: "d")
        user.closure { item in
            user1 = User(id: item?.id ?? 1, email: item?.email ?? "tt")
            print("Data11133\(user1)")
            return user1
        }
        print("Data111 id: \(user1.id), email: \(user1.email)")
        return (email: user1.email,id: user1.id)
    }
}
