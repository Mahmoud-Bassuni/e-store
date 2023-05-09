//  
//  VerificationScreenViewController.swift
//  e-store
//
//  Created by Hassan on 09/04/2023.
//
import UIKit
import Shared_UI
import RxSwift
import RxCocoa
class VerificationScreenViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var codeTextField1: CustomTextField!
    @IBOutlet weak var codeTextField2: CustomTextField!
    @IBOutlet weak var codeTextField3: CustomTextField!
    @IBOutlet weak var codeTextField4: CustomTextField!
    
    // MARK: Proprites
    
    var verificationViewModel: VerificationViewModel
    let disposeBag = DisposeBag()

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
        continueButtonPressed()
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
        verificationViewModel.checkConfigButton.subscribe(onNext: { [weak self] enable in
                    self?.submitButton.isEnableButtonStyle = enable
                }) .disposed(by: disposeBag)
        
    }
    
    private func bindTextField() {
        codeTextField1.rx.controlEvent(.editingChanged)
                   .asObservable()
                   .map { self.codeTextField1.text ?? "" }
                   .subscribe(onNext: { textCode in
                       self.verificationViewModel.updateTextFieldCode.onNext(.first(textCode ))
                       textCode.count == 1 ? self.moveToNext(self.codeTextField1) : self.moveToPrevious(self.codeTextField1)
                   }).disposed(by: disposeBag)
               codeTextField2.rx.controlEvent(.editingChanged)
                   .asObservable()
                   .map { self.codeTextField2.text ?? "" }
                   .subscribe(onNext: { textCode in
                       self.verificationViewModel.updateTextFieldCode.onNext(.second(textCode ))
                       textCode.count == 1 ? self.moveToNext(self.codeTextField2) : self.moveToPrevious(self.codeTextField2)
                   }).disposed(by: disposeBag)
               codeTextField3.rx.controlEvent(.editingChanged)
                   .asObservable()
                   .map { self.codeTextField3.text ?? "" }
                   .subscribe(onNext: { textCode in
                       self.verificationViewModel.updateTextFieldCode.onNext(.third(textCode ))
                       textCode.count == 1 ? self.moveToNext(self.codeTextField3) : self.moveToPrevious(self.codeTextField3)
                   }).disposed(by: disposeBag)
               codeTextField4.rx.controlEvent(.editingChanged)
                   .asObservable()
                   .map { self.codeTextField4.text ?? "" }
                   .subscribe(onNext: { textCode in
                       self.verificationViewModel.updateTextFieldCode.onNext(.fourth(textCode ))
                       textCode.count == 1 ? self.moveToNext(self.codeTextField4) : self.moveToPrevious(self.codeTextField4)
                   }).disposed(by: disposeBag)
    }
}

// MARK: Actions
extension VerificationScreenViewController {
    func continueButtonPressed() {
           submitButton.rx.controlEvent(.touchUpInside).asObservable()
               .subscribe( onNext : {
                   self.verificationViewModel.submitVerificationCode(viewController: self) {
                       self.showAlert(msg: "code syntax wrong ")
                   }
               })
               .disposed(by: disposeBag)
           
       }
    
}

// MARK: - Update TextField

extension VerificationScreenViewController {
    
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
