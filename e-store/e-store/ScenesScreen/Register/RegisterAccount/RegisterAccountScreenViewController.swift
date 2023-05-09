//  
//  RegisterAccountScreenViewController.swift
//  e-store
//
//  Created by Hassan on 09/04/2023.
//
import UIKit
import Shared_UI
import RxSwift
import RxCocoa
class RegisterAccountScreenViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var singInButton: UIButton!

    @IBOutlet weak var emailOrPhoneTextField: CustomTextField!
    
    // MARK: Proprites
    
    var registerViewModel: RegisterAccountViewModel
    let disposeBag = DisposeBag()

    // MARK: Init
    
    init(registerViewModel: RegisterAccountViewModel) {
        self.registerViewModel = registerViewModel
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
        buttonPressed()
    }
        
}

// MARK: Bind view model

extension RegisterAccountScreenViewController {
    
    private func bindViewModel() {
        registerViewModel.checkConfigButton.subscribe(onNext: { enable in
            self.submitButton.isEnableButtonStyle = enable
            
        }).disposed(by: disposeBag)
    }
    
    private func bindTextField() {
        emailOrPhoneTextField.rx.controlEvent(.editingChanged).asObservable()
            .map { self.emailOrPhoneTextField.text ?? "" }
            .subscribe(onNext: { userName in
                self.registerViewModel.updateEmailOrPhone.onNext(userName)
            }).disposed(by: disposeBag)
    }
}

// MARK: Actions

extension RegisterAccountScreenViewController {
    private func buttonPressed() {

        submitButton.rx.controlEvent(.touchUpInside).asObservable()
            .subscribe( onNext : {
                self.registerViewModel.submitUserName(viewController: self.self) {
                self.showAlert(msg: "username or phoneNumber is wrong syntax")
            }
            })
            .disposed(by: disposeBag)
        singInButton.rx.controlEvent(.touchUpInside).asObservable()
            .subscribe( onNext : {
                self.registerViewModel.popToRoot(viewController: self)
            })
            .disposed(by: disposeBag)
    }
    
    
}
