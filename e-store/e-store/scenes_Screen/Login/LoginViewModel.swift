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
    private var domain = FetchUserUseCase()
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
    func getTokenLogin(loginInfo localLoginInfo: (userName:String,passWord:String), completion: @escaping (String?, Error?) -> Void){
        domain.fetchTokenLoginUser(loginInfo: localLoginInfo){ token, error in
            completion(token?.token,error)
        }
    }
}
