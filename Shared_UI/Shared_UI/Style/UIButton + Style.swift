//
//  UIButton + Style.swift
//  Shared_UI
//
//  Created by Ahmed Atef on 16/03/2023.
//

import Foundation
import UIKit

extension UIButton {
    public enum ButtonStyle {
        case blueButton
        case lightBlueButton
        case grayButton
        case redButton
        case whiteButton
    }
    
    public func selectStyle(style : ButtonStyle) {
        switch style {
        case .blueButton:
            setupBlueButtonStyle()
        case .lightBlueButton :
            setupLightBlueButtonStyle()
        case .grayButton:
            setupGrayButtonStyle()
        case .redButton:
            setupRedButtonStyle()
        case .whiteButton:
            setupWhiteButtonStyle()
        }
    }
}
// MARK: - setup button styles
extension UIButton {
    
    private func configureCommonStyles() {
        titleLabel?.font = UIFont.buttonFont
        layer.cornerRadius = 10
        layer.masksToBounds = true
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    private func setupBlueButtonStyle() {
        configureCommonStyles()
        tintColor = UIColor.white
        backgroundColor = UIColor.mediumBlueColor
    }
    private func setupLightBlueButtonStyle() {
        configureCommonStyles()
        tintColor = UIColor.mediumBlueColor
        backgroundColor = UIColor.lightBlueColor
    }
    private func setupGrayButtonStyle() {
        configureCommonStyles()
        tintColor = UIColor.white
        backgroundColor = UIColor.silverColor
    }
    private func setupRedButtonStyle() {
        configureCommonStyles()
        tintColor = UIColor.white
        backgroundColor = UIColor.red
    }
    private func setupWhiteButtonStyle() {
        configureCommonStyles()
        tintColor = UIColor.navyBlackColor
        backgroundColor = UIColor.white
        layer.borderWidth = 1
        layer.borderColor = UIColor.navyBlackColor.cgColor
    }
}
