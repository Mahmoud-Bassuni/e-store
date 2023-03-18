//
//  LoginScreenViewController.swift
//  e-store
//
//  Created by Bassuni on 16/03/2023.
//

import UIKit

class LoginScreenViewController: UIViewController {

    //MARK: Outlets

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var password_txt: UITextField!
    @IBOutlet weak var submitBtn: UIButton!

    @IBOutlet weak var emailLbl: UILabel!
    
    @IBOutlet weak var IdLbl: UILabel!
    //MARK: Proprites
    var loginViewModel: LoginViewModel

    //MARK: Init

    init(loginViewModel: LoginViewModel) {
        self.loginViewModel = loginViewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        bindTextFields()
        updatedata()
    }
}

//MARK: Bind view model
extension LoginScreenViewController {

    private func bindViewModel() {
        loginViewModel.checkConfigButton { [weak self] enable in
            self?.submitBtn.isEnabled = enable
        }
    }

    private func bindTextFields() {
        emailTxt.addTarget(self, action: #selector(UpdateEmailTextField), for: .editingChanged)
        password_txt.addTarget(self, action: #selector(UpdatePasswordTextField), for: .editingChanged)
        
    }
    private func updatedata(){
        let user = loginViewModel.getdata()
        IdLbl.text = user.id
        emailLbl.text = user.email
    }
}

//MARK: Actions
extension LoginScreenViewController {
    @objc
    func UpdateEmailTextField(textField: UITextField) {
        loginViewModel.updateEmail(email: textField.text ?? "")
    }

    @objc
    func UpdatePasswordTextField(textField: UITextField) {
        loginViewModel.updatePassword(password: textField.text ?? "")
    }
}
