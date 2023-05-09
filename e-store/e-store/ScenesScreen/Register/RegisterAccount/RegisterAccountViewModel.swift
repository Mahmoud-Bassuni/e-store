//  
//  RegisterAccountViewModel.swift
//  e-store
//
//  Created by Hassan on 09/04/2023.
//
import Foundation
import RxSwift
import RxCocoa
// MARK: - ProtocolRegisterAccountViewModelInput

protocol RegisterAccountViewModelInput {
    
    func showVerification(viewController: ViewControllerType)
    func popToRoot(viewController: ViewControllerType)

}

// MARK: - ProtocolRegisterAccountViewModelOutput

protocol RegisterAccountViewModelOutput {
    
    func submitUserName (viewController: ViewControllerType,callback: @escaping () -> Void)
    func checkEmailOrPhone() -> Bool
}

// MARK: - RegisterAccountViewModel

class RegisterAccountViewModel {

    private var emailOrPhone = ""
    private var storeRouter: StoreRouter
    let disposeBag = DisposeBag()
    let updateEmailOrPhone = PublishSubject<String>()
    let checkConfigButton = ReplaySubject<Bool>.create(bufferSize: 1)
    
    init( storeRouter: StoreRouter) {
        self.storeRouter = storeRouter
        updateUsername()
    }
     private func updateUsername() {
        updateEmailOrPhone.subscribe(onNext: { username in
            self.emailOrPhone = username
            self.updateButtonState()
        }).disposed(by: disposeBag)
         updateButtonState()
    }
    private func updateButtonState() {
        let isEmailOrPhoneValid = !emailOrPhone.isEmpty
        checkConfigButton.onNext(isEmailOrPhoneValid)
    }
    
}

// MARK: - RegisterAccountViewModelInput

extension RegisterAccountViewModel: RegisterAccountViewModelInput {
    
    func showVerification(viewController: ViewControllerType) {
        storeRouter.showVerification(viewController: viewController)
    }
    func popToRoot(viewController: ViewControllerType) {
        storeRouter.popToRoot(viewController: viewController)
    }
}

// MARK: - RegisterAccountViewModelOutput

extension RegisterAccountViewModel: RegisterAccountViewModelOutput {
    
    func submitUserName (viewController: ViewControllerType,callback: @escaping () -> Void) {
        if checkEmailOrPhone() {
            showVerification(viewController: viewController)
        } else {
           callback()
        }
    }
    
    internal func checkEmailOrPhone() -> Bool {
        Validator.isValidEmail(email: emailOrPhone) || Validator.isValidPhoneNumber(phoneNumber: emailOrPhone)
    }
  
}
