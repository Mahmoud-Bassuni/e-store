//  
//  ProfilePasswordScreenViewController.swift
//  e-store
//
//  Created by Hassan on 10/04/2023.
//
import UIKit

class ProfilePasswordScreenViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var referalCodeTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    // MARK: Proprites
   
    // MARK: Init

    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTextField()
    }
}

// MARK: Bind view model
extension ProfilePasswordScreenViewController {

}

// MARK: Actions
extension ProfilePasswordScreenViewController {
   
}
// MARK: - Update TextField
extension ProfilePasswordScreenViewController {
    func updateTextField() {
        fullNameTextField.setLeftPaddingPoints(20)
        fullNameTextField.setRightPaddingPoints(5)
        fullNameTextField.layer.cornerRadius = 10
        passwordTextField.setLeftPaddingPoints(20)
        passwordTextField.setRightPaddingPoints(5)
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.applyPasswordTextField()
        referalCodeTextField.setLeftPaddingPoints(20)
        referalCodeTextField.setRightPaddingPoints(5)
        referalCodeTextField.layer.cornerRadius = 10
    }
}
