//  
//  VerificationViewModel.swift
//  e-store
//
//  Created by Hassan on 09/04/2023.
//
import UIKit
import RxSwift
import RxCocoa
// MARK: - ProtocolVerificationViewModelInput
protocol VerificationViewModelInput {
    func showUsernameAndPassword(viewController: ViewControllerType)
}

// MARK: - ProtocolVerificationViewModelOutput
protocol VerificationViewModelOutput {
    func submitVerificationCode (viewController: ViewControllerType,callback: @escaping () -> Void)
    
    func checkTextFieldCode() -> Bool
    
}

// MARK: - VerificationViewModel
class VerificationViewModel {
    
    private var text = ["","","","" ]
    
    private var storeRouter: StoreRouter
    let disposeBag = DisposeBag()
    let updateTextFieldCode = PublishSubject<TextFieldEnum>()
    let checkConfigButton = ReplaySubject<Bool>.create(bufferSize: 1)
    init( storeRouter: StoreRouter) {
        self.storeRouter = storeRouter
        updateTextField()
    }
    private func updateTextField() {
        updateTextFieldCode.subscribe(onNext: { textField in
            switch textField {
                
            case .first(let text1):
                self.text[0] = text1
            case .second(let text1):
                self.text[1] = text1
            case .third(let text1):
                self.text[2] = text1
            case .fourth(let text1):
                self.text[3] = text1
            }
            self.updateButtonState()
        }).disposed(by: disposeBag)
        updateButtonState()
    }
    private func updateButtonState() {
        
        let isText1Valid = !text[0].isEmpty
        let isText2Valid = !text[1].isEmpty
        let isText3Valid = !text[2].isEmpty
        let isText4Valid = !text[3].isEmpty
        let isbuttonEnable = isText1Valid && isText2Valid && isText3Valid && isText4Valid
        checkConfigButton.onNext(isbuttonEnable)
        
    }
    enum TextFieldEnum {
        case first(String)
        case second(String)
        case third(String)
        case fourth(String)
        
    }
}

// MARK: - VerificationViewModelInput
extension VerificationViewModel: VerificationViewModelInput {
    
    func showUsernameAndPassword(viewController: ViewControllerType) {
        storeRouter.showUsernameAndPassword(viewController: viewController)
    }
    
}

// MARK: - VerificationViewModelOutput
extension VerificationViewModel: VerificationViewModelOutput {
    
    func submitVerificationCode (viewController: ViewControllerType,callback: @escaping () -> Void) {
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
}
