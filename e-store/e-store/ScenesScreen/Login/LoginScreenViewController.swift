//
//  LoginScreenViewController.swift
//  e-store
//
//  Created by Bassuni on 16/03/2023.
//

import UIKit
import Domain
import Shared_UI

class LoginScreenViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet weak var emailPhoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    // MARK: Proprites
    var loginViewModel : LoginViewModel
    // MARK: Init

    init(loginViewModel: LoginViewModel) {
        self.loginViewModel = loginViewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func submitBtnAction(_ sender: Any) {
        loginViewModel.checkUser { msg in
            switch(msg) {
            case .validateError : self.showAlert(msg: "Email and Password aren't Valid!")
            case .failure(let error):
                self.showAlert(msg: error)
            case .success:
                self.showAlert(msg: "Validated")
            }
        }
    }
    // MARK: LifeCycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupNavigationItems()
        submitButton.selectStyle(style: .blueButton)
        signupButton.tintColor = UIColor.white
        passwordTextField.applyPasswordTextField()
        bindViewModel()
        bindTextFields()
    }
    
    private func setupNavigationItems() {
         
        let backArrow = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backArrowTapped))
         
        backArrow.tintColor = UIColor.navyBlackColor
        navigationItem.leftBarButtonItem = backArrow
     }
    
    @objc private func backArrowTapped() {
         // TODO:- Implement me
     }
    
}

// MARK: Bind view model
extension LoginScreenViewController {

    private func bindViewModel() {
        loginViewModel.checkConfigButton { [weak self] enable in
            self?.submitButton.isEnabled = enable
        }
    }

    private func bindTextFields() {
        emailPhoneTextField.addTarget(self, action: #selector(updateEmailTextField), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(updatePasswordTextField), for: .editingChanged)

    }
}

// MARK: Actions
extension LoginScreenViewController {
    @objc func updateEmailTextField(textField: UITextField) {
        loginViewModel.updateEmail(email: textField.text ?? "")
    }

    @objc func updatePasswordTextField(textField: UITextField) {
        loginViewModel.updatePassword(password: textField.text ?? "")
    }
}
