//
//  UITextField + Extension.swift
//  Shared_UI
//
//  Created by Ahmed Atef on 26/03/2023.
//

import Foundation
import UIKit

extension UITextField {
    public func applyPasswordTextField() {
        isSecureTextEntry = true
        rightView = createToggleButton()
        rightViewMode = .always
    }
    
    private func createToggleButton() -> UIButton {
        let eyeButton = UIButton()
        eyeButton.setImage(.hidePassswordIcon, for: .normal)
        eyeButton.tintColor = .black
        if #available(iOS 15.0, *) {
            var eyeButtonConfiguration = UIButton.Configuration.plain()
            eyeButtonConfiguration.buttonSize = .small
            eyeButton.configuration = eyeButtonConfiguration
        } else {
            eyeButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 16)
        }
        eyeButton.addTarget(self, action: #selector(toggleIconTapped), for: .touchUpInside)
        return eyeButton
    }
    
    @objc func toggleIconTapped(sender: UIButton) {
        isSecureTextEntry.toggle()
        let image = isSecureTextEntry ? UIImage.hidePassswordIcon: UIImage.showPasswordIcon
        sender.setImage(image, for: .normal)
    }
}

// MARK: - Add padding to textField
extension UITextField {
   public func setLeftPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    public func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
