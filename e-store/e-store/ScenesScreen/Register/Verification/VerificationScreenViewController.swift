//  
//  VerificationScreenViewController.swift
//  e-store
//
//  Created by Hassan on 09/04/2023.
//
import UIKit
import Shared_UI

class VerificationScreenViewController: UIViewController {
   
    // MARK: Outlets
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var codeTextField1: CustomTextField!
    @IBOutlet weak var codeTextField2: CustomTextField!
    @IBOutlet weak var codeTextField3: CustomTextField!
    @IBOutlet weak var codeTextField4: CustomTextField!

    // MARK: Proprites
    
    var verificationViewModel: VerificationViewModel
    
    // MARK: Init
    
    init(verificationViewModel: VerificationViewModel) {
        self.verificationViewModel = verificationViewModel
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
        codeTextField1.becomeFirstResponder()
    }
    
}

// MARK: Bind view model
extension VerificationScreenViewController {
   
    private func bindViewModel() {
        verificationViewModel.checkConfigButton { [weak self] enable in
            self?.submitButton.isEnabled = enable
            if enable {
                self?.submitButton.selectStyle(style: .blueButton)
            } else {
                self?.submitButton.selectStyle(style: .grayButton)
            }
        }
    }
    
    private func bindTextField() {
        codeTextField1.addTarget(self, action:#selector(updateTextField), for: .editingChanged)
        codeTextField2.addTarget(self, action:#selector(updateTextField), for: .editingChanged)
        codeTextField3.addTarget(self, action:#selector(updateTextField), for: .editingChanged)
        codeTextField4.addTarget(self, action:#selector(updateTextField), for: .editingChanged)
    }
}

// MARK: Actions
extension VerificationScreenViewController {
    @IBAction func continueButtonPressed(_ sender: UIButton) {
        if verificationViewModel.checkTextFieldCode() {
            push(viewController: StoreRouter.shared.showUsernameAndPassword())        } else {
            showAlert(msg: "code syntax wrong ")
        }
    }
   
}

// MARK: - Update TextField
extension VerificationScreenViewController {
  
    @objc func updateTextField (textField: UITextField) {
        
        verificationViewModel.updateTextFieldCode( textField)
        switch textField.placeholder {
            
        case "1":
            codeTextField2.becomeFirstResponder()
        case "2":
            codeTextField3.becomeFirstResponder()
        case "3":
            codeTextField4.becomeFirstResponder()
        default:
            codeTextField4.resignFirstResponder()
        }
        
    }
}
