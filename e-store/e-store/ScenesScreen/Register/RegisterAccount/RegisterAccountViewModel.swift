//  
//  RegisterAccountViewModel.swift
//  e-store
//
//  Created by Hassan on 09/04/2023.
//
import Foundation
import UIKit

// MARK: - ProtocolRegisterAccountViewModelInput

protocol RegisterAccountViewModelInput {
    
    func updateEmailOrPhone(emailOrPhone: String )
    func showVerification(viewController: ViewControllerType)
}

// MARK: - ProtocolRegisterAccountViewModelOutput

protocol RegisterAccountViewModelOutput {
   
    func checkConfigButton(callback: @escaping (Bool) -> Void)
    func checkEmailOrPhone() -> Bool
}

// MARK: - RegisterAccountViewModel

class RegisterAccountViewModel {

    private var emailOrPhone = ""
    private var checkButtonEnable : (Bool) -> Void = { _ in }
    private var storeRouter: StoreRouter
    init( storeRouter: StoreRouter) {
        self.storeRouter = storeRouter
    }
    func updateButtonState() {
        
        let isEmailOrPhoneValid = !emailOrPhone.isEmpty
        checkButtonEnable(isEmailOrPhoneValid)
        
    }
}

// MARK: - RegisterAccountViewModelInput

extension RegisterAccountViewModel: RegisterAccountViewModelInput {
    
    func updateEmailOrPhone(emailOrPhone: String) {
        self.emailOrPhone = emailOrPhone
        updateButtonState()
    }
    func showVerification(viewController: ViewControllerType) {
        storeRouter.showVerification(viewController: viewController)
    }

}

// MARK: - RegisterAccountViewModelOutput

extension RegisterAccountViewModel: RegisterAccountViewModelOutput {
    func checkEmailOrPhone() -> Bool {
        Validator.isValidEmail(email: emailOrPhone) || Validator.isValidPhoneNumber(phoneNumber: emailOrPhone)
    }
    
    func checkConfigButton(callback: @escaping (Bool) -> Void) {
        checkButtonEnable = callback
        updateButtonState()
    }
    
}
