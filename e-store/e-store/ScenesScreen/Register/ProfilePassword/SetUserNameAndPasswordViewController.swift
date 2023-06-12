//  
//  SetUserNameAndPasswordViewController.swift
//  e-store
//
//  Created by Hassan on 10/04/2023.
//
import UIKit
import Shared_UI
import RxSwift
import RxCocoa
class SetUserNameAndPasswordViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var referalCodeTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var fullNameTextField: CustomTextField!
    @IBOutlet weak var submitButton: UIButton!

    // MARK: Proprites
    
    var setUserNameAndPasswordViewModel: SetUserNameAndPasswordViewModel
    let disposeBag = DisposeBag()
    // MARK: Init
    
    init(setUserNameAndPasswordViewModel: SetUserNameAndPasswordViewModel) {
        self.setUserNameAndPasswordViewModel = setUserNameAndPasswordViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        bindTextField()
        bindViewModel()
        continueButtonPressed()
    }
    
}

// MARK: Bind view model
extension SetUserNameAndPasswordViewController {
    private func bindViewModel() {
        setUserNameAndPasswordViewModel.checkConfigButton.subscribe(onNext: { [weak self] enable in
            self?.submitButton.isEnableButtonStyle = enable
        }).disposed(by: disposeBag)
    }
    
    private func bindTextField() {
        
        passwordTextField.applyPasswordTextField()
        fullNameTextField.rx.controlEvent(.editingChanged).asObservable()
            .map {self.fullNameTextField.text ?? ""}
            .subscribe(onNext: { fullNameText in
                self.setUserNameAndPasswordViewModel.updateFullNameText.onNext(fullNameText)
            }).disposed(by: disposeBag)
        passwordTextField.rx.controlEvent(.editingChanged).asObservable()
            .map {self.passwordTextField.text ?? ""}
            .subscribe(onNext: { passwordText in
                self.setUserNameAndPasswordViewModel.updatePasswordText.onNext(passwordText)
            }).disposed(by: disposeBag)
        referalCodeTextField.rx.controlEvent(.editingChanged).asObservable()
            .map {self.referalCodeTextField.text ?? ""}
            .subscribe(onNext: { referalCode in
                self.setUserNameAndPasswordViewModel.updateReferalCodeText.onNext(referalCode)
            }).disposed(by: disposeBag)
       
    }
    
}

// MARK: Actions
extension SetUserNameAndPasswordViewController {
    private func continueButtonPressed() {
        submitButton.rx.controlEvent(.touchUpInside).asObservable().subscribe(onNext: {
            self.setUserNameAndPasswordViewModel.register(viewController: self) {
                self.showAlert(msg: "password or full name syntax wrong ")
            }
        }).disposed(by: disposeBag)
    }
}
