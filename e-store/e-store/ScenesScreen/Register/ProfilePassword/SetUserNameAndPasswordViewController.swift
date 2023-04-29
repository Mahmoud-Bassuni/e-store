//  
//  SetUserNameAndPasswordViewController.swift
//  e-store
//
//  Created by Hassan on 10/04/2023.
//
import UIKit
import Shared_UI
class SetUserNameAndPasswordViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var referalCodeTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var fullNameTextField: CustomTextField!
    @IBOutlet weak var submitButton: UIButton!

    // MARK: Proprites
    
    var setUserNameAndPasswordViewModel: SetUserNameAndPasswordViewModel
    
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
    }
    
}

// MARK: Bind view model
extension SetUserNameAndPasswordViewController {
    private func bindViewModel() {
        setUserNameAndPasswordViewModel.checkConfigButton { [weak self] enable in
            self?.submitButton.isEnableButtonStyle = enable
        }
    }
    
    private func bindTextField() {
        passwordTextField.applyPasswordTextField()
        referalCodeTextField.addTarget(self, action:#selector(updateReferalCodeTextField), for: .editingChanged)
        passwordTextField.addTarget(self, action:#selector(updatePasswordTextField), for: .editingChanged)
        fullNameTextField.addTarget(self, action:#selector(updateFullNameTextField), for: .editingChanged)
       
    }
    
}

// MARK: Actions
extension SetUserNameAndPasswordViewController {
    @IBAction func continueButtonPressed(_ sender: UIButton) {
        setUserNameAndPasswordViewModel.submit(viewController: self) {
            self.showAlert(msg: "password or full name syntax wrong ")
            
        }
        
    }
}
// MARK: - Update TextField
extension SetUserNameAndPasswordViewController {
  
    @objc func updateReferalCodeTextField (textField: UITextField) {
        
        setUserNameAndPasswordViewModel.updateReferalCodeText( textField.text ?? "")
    }
    @objc func updatePasswordTextField (textField: UITextField) {
        
        setUserNameAndPasswordViewModel.updatePasswordText( textField.text ?? "")
    }
    @objc func updateFullNameTextField (textField: UITextField) {
        
        setUserNameAndPasswordViewModel.updateFullNameText( textField.text ?? "")
    }
    
}
