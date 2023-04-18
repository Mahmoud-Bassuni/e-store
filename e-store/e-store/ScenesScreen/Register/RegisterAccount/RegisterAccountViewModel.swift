//  
//  RegisterAccountViewModel.swift
//  e-store
//
//  Created by Hassan on 09/04/2023.
//
import Foundation

// MARK: - ProtocolRegisterAccountViewModelInput

protocol RegisterAccountViewModelInput {
    
    func updateEmailOrPhone(emailOrPhone: String )
    
}

// MARK: - ProtocolRegisterAccountViewModelOutput

protocol RegisterAccountViewModelOutput {
   
    func checkConfigButton(callback: @escaping (Bool) -> Void)

}

// MARK: - RegisterAccountViewModel

class RegisterAccountViewModel {

    private var emailOrPhone = ""
    private var checkButtonEnable : (Bool) -> Void = { _ in }

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
    
}

// MARK: - RegisterAccountViewModelOutput

extension RegisterAccountViewModel: RegisterAccountViewModelOutput {
   
    func checkConfigButton(callback: @escaping (Bool) -> Void) {
        checkButtonEnable = callback
        updateButtonState()
    }
    
}
