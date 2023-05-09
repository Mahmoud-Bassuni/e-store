//  
//  SetUserNameAndPasswordViewModel.swift
//  e-store
//
//  Created by Hassan on 10/04/2023.
//
import Foundation
import RxSwift
import RxCocoa
// MARK: - ProtocolSetUserNameAndPasswordViewModelInput
protocol SetUserNameAndPasswordViewModelInput {
    
    func showLogin(viewController: ViewControllerType)
}

// MARK: - ProtocolSetUserNameAndPasswordViewModelOutput
protocol SetUserNameAndPasswordViewModelOutput {
    func register (viewController: ViewControllerType,callback: @escaping () -> Void)
    func checkTextField() -> Bool

}

// MARK: - SetUserNameAndPasswordViewModel
class SetUserNameAndPasswordViewModel {
    private var fullNameText = ""
    private var passwordText = ""
    private var referalCodeText = ""
    private var storeRouter: StoreRouter
    let disposeBag = DisposeBag()
    var updateReferalCodeText = PublishSubject<String>()
    var updatePasswordText = PublishSubject<String>()
    var updateFullNameText = PublishSubject<String>()
    let checkConfigButton = ReplaySubject<Bool>.create(bufferSize: 1)
    init( storeRouter: StoreRouter) {
        self.storeRouter = storeRouter
        updateTextField()
    }
    private func updateTextField() {
        updateFullNameText.subscribe(onNext: { fullName in
            self.fullNameText = fullName
            self.updateButtonState()
        }).disposed(by: disposeBag)
        updatePasswordText.subscribe(onNext: { password in
            self.passwordText = password
            self.updateButtonState()
        }).disposed(by: disposeBag)
        updateReferalCodeText.subscribe(onNext: { referalCode in
            self.referalCodeText = referalCode
            self.updateButtonState()
        }).disposed(by: disposeBag)
        updateButtonState()
    }
    func updateButtonState() {
        
        let isFullNameTextValid = !fullNameText.isEmpty
        let isPasswordTextValid = !passwordText.isEmpty
        let isbuttonEnable = isFullNameTextValid && isPasswordTextValid 
        checkConfigButton.onNext(isbuttonEnable)
        
    }
}

// MARK: - SetUserNameAndPasswordViewModelInput
extension SetUserNameAndPasswordViewModel: SetUserNameAndPasswordViewModelInput {
    func showLogin(viewController: ViewControllerType) {
        storeRouter.popToRoot(viewController: viewController)
    }
    
}

// MARK: - SetUserNameAndPasswordViewModelInput
extension SetUserNameAndPasswordViewModel: SetUserNameAndPasswordViewModelOutput {
    
    func register (viewController: ViewControllerType,callback: @escaping () -> Void) {
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
    
}
