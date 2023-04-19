//
//  UIImageView + Extension.swift
//  Shared_UI
//
//  Created by Ahmed Atef on 13/04/2023.
//

import Foundation
import UIKit
import Kingfisher

protocol ImageDownloadable {
    func setImage(for stringUrl: String, placeHolderImage: UIImage)
}

extension UIImageView: ImageDownloadable {

    func setImage(for stringUrl: String, placeHolderImage: UIImage) {
        let url = URL(string: stringUrl)
        kf.setImage(with: url, placeholder: placeHolderImage)
    }
}
