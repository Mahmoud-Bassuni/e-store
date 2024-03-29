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
        setDelegates()
    }
    
    private func setDelegates() {
        [codeTextField1, codeTextField2, codeTextField3, codeTextField4].forEach { textField in
            textField?.delegate = self
        }
    }
    
}

// MARK: Bind view model
extension VerificationScreenViewController {
    
    private func bindViewModel() {
        verificationViewModel.checkConfigButton { [weak self] enable in
            self?.submitButton.isEnableButtonStyle = enable
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
        verificationViewModel.submitVerificationCode(viewController: self) {
            self.showAlert(msg: "code syntax wrong ")
        }
        
    }
    
}

// MARK: - Update TextField

extension VerificationScreenViewController {
    
    @objc private func updateTextField(_ textField: UITextField) {
        verificationViewModel.updateTextFieldCode( textField)
        
        textField.text?.count == 1
        ? moveToNext(textField)
        : moveToPrevious(textField)

    }
    
    private func moveToNext(_ textField: UITextField) {
        switch textField {
        case codeTextField1:
            codeTextField2.becomeFirstResponder()
        case codeTextField2:
            codeTextField3.becomeFirstResponder()
        case codeTextField3:
            codeTextField4.becomeFirstResponder()
        case codeTextField4:
            codeTextField4.resignFirstResponder()
        default:
            break
        }
    }
    private func moveToPrevious(_ textField: UITextField) {
        switch textField {
        case codeTextField4:
            codeTextField3.becomeFirstResponder()
        case codeTextField3:
            codeTextField2.becomeFirstResponder()
        case codeTextField2:
            codeTextField1.becomeFirstResponder()
        case codeTextField1:
            break
        default:
            break
        }
    }
    
}

// MARK: - Extension for limit textfield text

extension VerificationScreenViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return textField.text?.count ?? 0 < 1 || string == ""
    }
}
