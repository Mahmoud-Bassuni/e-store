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

// MARK: - Extension for Kingfisher

extension UIImageView: ImageDownloadable {

    public func setImage(for stringUrl: String, placeHolderImage: UIImage) {
        let url = URL(string: stringUrl)
        kf.setImage(with: url, placeholder: placeHolderImage)
    }
}

// MARK: - Extension for rounded images

extension UIImageView {
    public func makeRounded() {
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }
}
