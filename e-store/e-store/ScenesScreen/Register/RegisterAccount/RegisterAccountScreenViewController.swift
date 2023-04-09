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
    
    @IBOutlet weak var emailPhoneTextField: UITextField!
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
        updateTextField()
    }
}

// MARK: Bind view model
extension RegisterAccountScreenViewController {

}

// MARK: Actions
extension RegisterAccountScreenViewController {
   
}

// MARK: - Update TextField
extension RegisterAccountScreenViewController {
    func updateTextField() {
        emailPhoneTextField.setLeftPaddingPoints(20)
        emailPhoneTextField.setRightPaddingPoints(5)
        emailPhoneTextField.layer.cornerRadius = 10
    }
}
