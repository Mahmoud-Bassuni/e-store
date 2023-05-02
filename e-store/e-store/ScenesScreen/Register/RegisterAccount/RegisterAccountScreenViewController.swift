//  
//  RegisterAccountScreenViewController.swift
//  e-store
//
//  Created by Hassan on 09/04/2023.
//
import UIKit
import Shared_UI

class RegisterAccountScreenViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var emailOrPhoneTextField: CustomTextField!
    
    // MARK: Proprites
    
    var registerViewModel: RegisterAccountViewModel

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
    }
        
}

// MARK: Bind view model

extension RegisterAccountScreenViewController {
    
    private func bindViewModel() {
        registerViewModel.checkConfigButton { [weak self] enable in
            self?.submitButton.isEnableButtonStyle = enable
        }
    }
    
    private func bindTextField() {
        emailOrPhoneTextField.addTarget(self, action:#selector(updateEmailOrPhoneTextField), for: .editingChanged)
    }
}

// MARK: Actions

extension RegisterAccountScreenViewController {
    @IBAction func continueButtonPressed(_ sender: UIButton) {

        registerViewModel.submitUserName(viewController: self) {
            self.showAlert(msg: "username or phoneNumber is wrong syntax")
        }
    }
    @IBAction func singInButtonPressed(_ sender: UIButton) {
        registerViewModel.popToRoot(viewController: self)
    }
}
// MARK: - Update TextField
extension RegisterAccountScreenViewController {
  
    @objc func updateEmailOrPhoneTextField (textField: UITextField) {
        registerViewModel.updateEmailOrPhone(emailOrPhone: textField.text ?? "" )
    }
}
