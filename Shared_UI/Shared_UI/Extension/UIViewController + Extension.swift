//
//  UIViewController + Extension.swift
//  Shared_UI
//
//  Created by Zeyad on 13/04/2023.
//

import Foundation
import UIKit

extension UIViewController{
    public func showAlert(msg:String) {
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert,animated: true,completion: nil)
    }
}
