//
//  UITextField + Extension.swift
//  Shared_UI
//
//  Created by Ahmed Atef on 26/03/2023.
//

import Foundation
import UIKit

extension UITextField {
    public func applyPaswwordTextField() {
        isSecureTextEntry = true
        rightView = createToggleButton()
        rightViewMode = .always
    }
    
    private func createToggleButton() -> UIButton {
        let eyeButton = UIButton()
        eyeButton.setImage(.hidePassswordIcon, for: .normal)
        eyeButton.tintColor = .black
        if #available(iOS 15.0, *) {
            var eyeButtonConfiguration = UIButton.Configuration.bordered()
            eyeButtonConfiguration.buttonSize = .small
            eyeButton.configuration = eyeButtonConfiguration
        } else {
            eyeButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 8)
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
