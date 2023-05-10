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
    
    func updateUsername()
    func updatePassword()
    func showRegisterAccount(viewController: ViewControllerType)
    
}

protocol LoginViewModelOutput {
    
    func validUsername() -> Bool
    func validPassword() -> Bool
    func checkUser(completion:@escaping (LoginMessage) -> Void)
    
}

// MARK: LoginViewModel
class LoginViewModel {
    
    private var domain = UserUseCase()
    private var username = ""
    private var password = ""
    private var storeRouter: StoreRouter
    let disposeBag = DisposeBag()
    var updateUsernameText = PublishSubject<String>()
    var updatePasswordText = PublishSubject<String>()
    let checkConfigButton = ReplaySubject<Bool>.create(bufferSize: 1)
    
    init( storeRouter: StoreRouter) {
        self.storeRouter = storeRouter
        updateUsername()
        updatePassword()
    }
    
    func updateButtonState() {

        let isEmailValid = !username.isEmpty
        let isPasswordValid = !password.isEmpty
        let isButtonEnable = isEmailValid && isPasswordValid
        checkConfigButton.onNext(isButtonEnable)
    }
}

// MARK: LoginViewModelInput
extension LoginViewModel: LoginViewModelInput {

    func updateUsername() {
        updateUsernameText.subscribe(onNext: { username in
            self.username = username
            self.updateButtonState()
        }).disposed(by: disposeBag)
        updateButtonState()
    }

    func updatePassword() {
        updatePasswordText.subscribe(onNext: { password in
            self.password = password
            self.updateButtonState()
        }).disposed(by: disposeBag)
        updateButtonState()
    }
    
    func showRegisterAccount(viewController: ViewControllerType) {
        storeRouter.showRegisterAccount(viewController: viewController)
    }

}

// MARK: LoginViewModelInput
extension LoginViewModel: LoginViewModelOutput {

    func validUsername() -> Bool {
        Validator.isValidUsername(username: self.username)
    }
    
    func validPassword() -> Bool {
        Validator.isValidPassword(password: self.password)
    }
}
// MARK: get data from domain
extension LoginViewModel {
    
    func checkUser(completion:@escaping (LoginMessage) -> Void) {
        let checkUsernameAndPassword = checkUsernameAndPassword()
        if(!checkUsernameAndPassword) {
            completion(.validateError)
        } else {
            domain.login(loginInfo: (self.username, self.password)) { result in
                switch result {
                case .success(let token):
                    print("Login successful, token: \(token)")
                    completion(.success)
                case .failure(let error):
                    print("Login failed, error: \(error)")
                    completion(.failure(error.description))
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
