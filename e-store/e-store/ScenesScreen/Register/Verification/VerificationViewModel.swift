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

}

// MARK: - ProtocolVerificationViewModelOutput
protocol VerificationViewModelOutput {
    
    func checkConfigButton(callback: @escaping (Bool) -> Void)

}

// MARK: - VerificationViewModel
class VerificationViewModel {

    private var text = ["","","","" ]
    private var checkButtonEnable : (Bool) -> Void = { _ in }

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
        let numericCharacterSet = CharacterSet.decimalDigits
        let currentText = textField.text ?? ""
        let newText = currentText.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        if newText.count > 1 || newText.count == 1 && !numericCharacterSet
            .isSuperset(of: CharacterSet(charactersIn: newText)) {
            textField.text = currentText
        } else {
            textField.text = newText
        }
        text[(Int(textField.placeholder ?? "1" ) ?? 1) - 1] = textField.text ?? ""
        updateButtonState()
        textField.resignFirstResponder()
    }
    
}

// MARK: - VerificationViewModelInput
extension VerificationViewModel: VerificationViewModelOutput {

    func checkConfigButton(callback: @escaping (Bool) -> Void) {
        checkButtonEnable = callback
        updateButtonState()
    }
    
}
