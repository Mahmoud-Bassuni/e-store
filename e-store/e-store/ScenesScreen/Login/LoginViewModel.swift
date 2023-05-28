//
//  LoginViewModel.swift
//  e-store
//
//  Created by Zeyad on 27/03/2023.
//
import Foundation
import Domain
import RxCocoa
import RxSwift

protocol LoginViewModelInput {
    
    func showRegisterAccount(viewController: ViewControllerType)
    
}

protocol LoginViewModelOutput {
    
    func validUsername() -> Bool
    func validPassword() -> Bool
    func checkUser()
    
}

// MARK: LoginViewModel
class LoginViewModel {
    
    private var domain = UserUseCase()
    private var storeRouter: StoreRouter
    let disposeBag = DisposeBag()
    var updateUsernameText = BehaviorRelay<String>(value: "")
    var updatePasswordText = BehaviorRelay<String>(value: "")
    var submitResponse = PublishSubject<LoginMessage>()
    let checkConfigButton = BehaviorRelay<Bool>(value: false)
    
    init( storeRouter: StoreRouter) {
        self.storeRouter = storeRouter
        
        Observable.combineLatest(updateUsernameText.asObservable(), updatePasswordText.asObservable()).subscribe(onNext:{ [weak self] (updateUsernameText, updatePasswordText) in
            guard let self = self else {return}
            self.checkConfigButton.accept(self.updateButtonState(username: updateUsernameText, password: updatePasswordText))
        }).disposed(by: disposeBag)
        
    }
    
    func updateButtonState(username:String, password: String) -> Bool {
        let isEmailValid = !username.isEmpty
        let isPasswordValid = !password.isEmpty
        return isEmailValid && isPasswordValid
    }
}

// MARK: LoginViewModelInput
extension LoginViewModel: LoginViewModelInput {
    
    func showRegisterAccount(viewController: ViewControllerType) {
        storeRouter.showRegisterAccount(viewController: viewController)
    }

}

// MARK: LoginViewModelInput
extension LoginViewModel: LoginViewModelOutput {

    func validUsername() -> Bool {
        Validator.isValidUsername(username: updateUsernameText.value)
    }
    
    func validPassword() -> Bool {
        Validator.isValidPassword(password: updatePasswordText.value)
    }
}

// MARK: get data from domain
extension LoginViewModel {
    
    func checkUser() {
        let checkUsernameAndPassword = checkUsernameAndPassword()
        if(!checkUsernameAndPassword) {
            submitResponse.onNext(.validateError)
        } else {
            domain.login(loginInfo: (self.updateUsernameText.value, self.updatePasswordText.value)) { result in
                switch result {
                case .success(let token):
                    print("Login successful, token: \(token)")
                    self.submitResponse.onNext(.success)
                case .failure(let error):
                    print("Login failed, error: \(error)")
                    self.submitResponse.onNext(.failure(error.description))
                }
            }
        }
    }
}

extension LoginViewModel {
    
    func checkUsernameAndPassword() -> Bool {
        let emailValid :Bool = validUsername()
        let passwordValid :Bool = validPassword()
        if( (emailValid && passwordValid) == false) {
            return false
       }
        return true
    }
}
