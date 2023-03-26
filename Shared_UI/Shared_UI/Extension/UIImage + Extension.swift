//
//  UIImage + Extension.swift
//  Shared_UI
//
//  Created by Ahmed Atef on 26/03/2023.
//

import Foundation
import UIKit

extension UIImage {
    static var showPasswordIcon: UIImage {
        return UIImage(systemName: "eye") ?? UIImage()
    }
    static var hidePassswordIcon: UIImage {
        return UIImage(systemName: "eye.slash") ?? UIImage()
    }
}
