//
//  LoginScreenViewController.swift
//  e-store
//
//  Created by Bassuni on 16/03/2023.
//

import UIKit
import Domain

class LoginScreenViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var submitBtn: UIButton!

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
    func showAlert(msg:String, vc1:UIViewController) {
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc1.present(alert,animated: true,completion: nil)
    }
    
    @IBAction func submitBtnAction(_ sender: Any) {
        var emailValid :Bool = loginViewModel.isValidEmail(emailTxt.text ?? "")
        var passwordValid :Bool = loginViewModel.isValidPassword(passwordTxt.text ?? "")
        if( (emailValid || passwordValid) == false) {
            showAlert(msg: "Email & Password are incorrect", vc1: self)
        }
        else if(emailValid == false) {
            showAlert(msg: "Email is incorrect", vc1: self)
        }
        else if(passwordValid == false) {
            showAlert(msg: "Password is incorrect", vc1: self)
        }
        
    }
    

    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        bindTextFields()
    }
}

// MARK: Bind view model
extension LoginScreenViewController {

    private func bindViewModel() {
        loginViewModel.checkConfigButton { [weak self] enable in
            self?.submitBtn.isEnabled = enable
        }
    }

    private func bindTextFields() {
        emailTxt.addTarget(self, action: #selector(updateEmailTextField), for: .editingChanged)
        passwordTxt.addTarget(self, action: #selector(updatePasswordTextField), for: .editingChanged)

    }
}

// MARK: Actions
extension LoginScreenViewController {
    @objc
    func updateEmailTextField(textField: UITextField) {
        loginViewModel.updateEmail(email: textField.text ?? "")
    }

    @objc
    func updatePasswordTextField(textField: UITextField) {
        loginViewModel.updatePassword(password: textField.text ?? "")
    }
    
    
    
}
