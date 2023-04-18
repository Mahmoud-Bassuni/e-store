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
        let isReferalCodeTextValid = !referalCodeText.isEmpty
        let isbuttonEnable = isFullNameTextValid && isPasswordTextValid && isReferalCodeTextValid
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
    }
    
    func updateFullNameText(_ text: String) {
        fullNameText = text
    }
    
}

// MARK: - SetUserNameAndPasswordViewModelInput
extension SetUserNameAndPasswordViewModel: SetUserNameAndPasswordViewModelOutput {
    
    func checkConfigButton(callback: @escaping (Bool) -> Void) {
        checkButtonEnable = callback
        updateButtonState()
    }
}
