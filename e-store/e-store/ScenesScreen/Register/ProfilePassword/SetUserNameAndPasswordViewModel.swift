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
    func showLogin(viewController: ViewControllerType)
}

// MARK: - ProtocolSetUserNameAndPasswordViewModelOutput
protocol SetUserNameAndPasswordViewModelOutput {
    func submitRegister (viewController: ViewControllerType,callback: @escaping () -> Void)
    func checkConfigButton(callback: @escaping (Bool) -> Void)
    func checkTextField() -> Bool

}

// MARK: - SetUserNameAndPasswordViewModel
class SetUserNameAndPasswordViewModel {
    private var fullNameText = ""
    private var passwordText = ""
    private var referalCodeText = ""
    private var checkButtonEnable : (Bool) -> Void = { _ in }
    private var storeRouter: StoreRouter
    init( storeRouter: StoreRouter) {
        self.storeRouter = storeRouter
    }
    func updateButtonState() {
        
        let isFullNameTextValid = !fullNameText.isEmpty
        let isPasswordTextValid = !passwordText.isEmpty
        let isbuttonEnable = isFullNameTextValid && isPasswordTextValid 
        checkButtonEnable(isbuttonEnable)
        
    }
}

// MARK: - SetUserNameAndPasswordViewModelInput
extension SetUserNameAndPasswordViewModel: SetUserNameAndPasswordViewModelInput {
    func showLogin(viewController: ViewControllerType) {
        storeRouter.popToRoot(viewController: viewController)
    }
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
    
    func submitRegister (viewController: ViewControllerType,callback: @escaping () -> Void) {
        if checkTextField() {
            showLogin(viewController: viewController)
        } else {
           callback()
        }
    }
    
    internal func checkTextField() -> Bool {
        Validator.isValidPassword(password: passwordText) &&
        Validator.isValidFullName(fullName: fullNameText)
    }
    
    func checkConfigButton(callback: @escaping (Bool) -> Void) {
        checkButtonEnable = callback
        updateButtonState()
    }
}
