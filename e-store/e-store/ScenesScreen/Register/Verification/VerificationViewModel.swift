//  
//  VerificationViewModel.swift
//  e-store
//
//  Created by Hassan on 09/04/2023.
//
import UIKit

// MARK: - ProtocolVerificationViewModelInput
protocol VerificationViewModelInput {
    
    func updateTextFieldCode(_ textField: UITextField )
    func showUsernameAndPassword(viewController: ViewControllerType)
}

// MARK: - ProtocolVerificationViewModelOutput
protocol VerificationViewModelOutput {
    func checkContinueButton (viewController: ViewControllerType,callback: @escaping () -> Void)
    func checkConfigButton(callback: @escaping (Bool) -> Void)
    func checkTextFieldCode() -> Bool

}

// MARK: - VerificationViewModel
class VerificationViewModel {

    private var text = ["","","","" ]
    private var checkButtonEnable : (Bool) -> Void = { _ in }
    private var storeRouter: StoreRouter
    init( storeRouter: StoreRouter) {
        self.storeRouter = storeRouter
    }
    func updateButtonState() {
        
        let isText1Valid = !text[0].isEmpty
        let isText2Valid = !text[1].isEmpty
        let isText3Valid = !text[2].isEmpty
        let isText4Valid = !text[3].isEmpty
        let isbuttonEnable = isText1Valid && isText2Valid && isText3Valid && isText4Valid
        checkButtonEnable(isbuttonEnable)
        
    }
    
}

// MARK: - VerificationViewModelInput
extension VerificationViewModel: VerificationViewModelInput {

    func updateTextFieldCode(_ textField: UITextField ) {
        text[(Int(textField.placeholder ?? "1" ) ?? 1) - 1] = textField.text ?? ""
        updateButtonState()
       
    }
    func showUsernameAndPassword(viewController: ViewControllerType) {
        storeRouter.showUsernameAndPassword(viewController: viewController)
    }
    
}

// MARK: - VerificationViewModelOutput
extension VerificationViewModel: VerificationViewModelOutput {
    
    func checkContinueButton (viewController: ViewControllerType,callback: @escaping () -> Void){
        if checkTextFieldCode() {
            showUsernameAndPassword(viewController: viewController)
        } else {
           callback()
        }
    }
    
    internal func checkTextFieldCode() -> Bool {
        return Validator.hasOneDigit(input: text[0]) &&
        Validator.hasOneDigit(input: text[1]) &&
        Validator.hasOneDigit(input: text[2]) &&
        Validator.hasOneDigit(input: text[3]) 
    }
        
    func checkConfigButton(callback: @escaping (Bool) -> Void) {
        checkButtonEnable = callback
        updateButtonState()
    }
    
}
