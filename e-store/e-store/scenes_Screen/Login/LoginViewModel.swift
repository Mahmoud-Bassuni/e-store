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

//MARK:LoginViewModel
class LoginViewModel {
    private let user = FetchUserUseCase().fetchUserData()
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


//MARK:LoginViewModelInput
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
//MARK:LoginViewModelInput
extension LoginViewModel: LoginViewModelOutput {

    func checkConfigButton(callback: @escaping (Bool) -> Void) {
        
        self.checkButtonEable = callback
        
        self.updateButtonState()
    }
}
//MARK:- get data from domain
extension LoginViewModel{
    func getdata()->(email:String,id:String){
        (email: user.email,id: user.id)
    }
}
