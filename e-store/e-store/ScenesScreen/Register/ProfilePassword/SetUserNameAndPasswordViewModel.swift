//  
//  SetUserNameAndPasswordViewModel.swift
//  e-store
//
//  Created by Hassan on 10/04/2023.
//
import Foundation

// MARK: - ProtocolSetUserNameAndPasswordViewModelInput
protocol SetUserNameAndPasswordViewModelInput {
    
    func updateReferalCodeText(_ text: String )
    func updatePasswordText(_ text: String )
    func updateFullNameText(_ text: String )

}

// MARK: - ProtocolSetUserNameAndPasswordViewModelOutput
protocol SetUserNameAndPasswordViewModelOutput {
    
    func checkConfigButton(callback: @escaping (Bool) -> Void)
    func checkTextFieldCode() -> Bool

}

// MARK: - SetUserNameAndPasswordViewModel
class SetUserNameAndPasswordViewModel {
    private var fullNameText = ""
    private var passwordText = ""
    private var referalCodeText = ""
    private var checkButtonEnable : (Bool) -> Void = { _ in }
    
    func updateButtonState() {
        
        let isFullNameTextValid = !fullNameText.isEmpty
        let isPasswordTextValid = !passwordText.isEmpty
        let isbuttonEnable = isFullNameTextValid && isPasswordTextValid 
        checkButtonEnable(isbuttonEnable)
        
    }
}

// MARK: - SetUserNameAndPasswordViewModelInput
extension SetUserNameAndPasswordViewModel: SetUserNameAndPasswordViewModelInput {
    func updateReferalCodeText(_ text: String) {
        referalCodeText = text
    }
    
    func updatePasswordText(_ text: String) {
        passwordText = text
        updateButtonState()
    }
    
    func updateFullNameText(_ text: String) {
        fullNameText = text
        updateButtonState()
    }
    
}

// MARK: - SetUserNameAndPasswordViewModelInput
extension SetUserNameAndPasswordViewModel: SetUserNameAndPasswordViewModelOutput {
    func checkTextFieldCode() -> Bool {
        Validator.isValidPassword(password: passwordText) &&         Validator.isValidFullName(fullName: fullNameText)
    }
    
    func checkConfigButton(callback: @escaping (Bool) -> Void) {
        checkButtonEnable = callback
        updateButtonState()
    }
}
