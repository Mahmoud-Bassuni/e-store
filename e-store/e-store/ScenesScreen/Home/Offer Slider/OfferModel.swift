//
//  OfferModel.swift
//  e-store
//
//  Created by Hassan on 30/04/2023.
//

import UIKit

class OfferModel {
    var title: String
    var description: String
    var photo: UIImage
    init(title: String, description: String, photo: UIImage = Asset.offerBackground.image) {
        self.title = title
        self.description = description
        self.photo = photo
    }
}
