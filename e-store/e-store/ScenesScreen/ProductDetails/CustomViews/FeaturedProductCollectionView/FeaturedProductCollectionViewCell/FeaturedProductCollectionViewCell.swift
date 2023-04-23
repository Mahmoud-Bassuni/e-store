//
//  FeaturedProductCollectionViewCell.swift
//  e-store
//
//  Created by Ahmed Atef on 23/04/2023.
//

import UIKit

class FeaturedProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet private weak var productName: UILabel!
    @IBOutlet private weak var productPrice: UILabel!
    @IBOutlet private weak var productRate: UILabel!
    @IBOutlet private weak var productReviewsNumber: UILabel!
    
    static let identifier = String(describing: FeaturedProductCollectionViewCell.self)

    func setupCell(featuredProductModel: FeaturedProductModel) {
        self.productImage.image = featuredProductModel.productImage
        self.productName.text = featuredProductModel.productName
        self.productPrice.text = "\(featuredProductModel.productPrice)"
        self.productRate.text = "\(featuredProductModel.productRate)"
        self.productReviewsNumber.text = "\(featuredProductModel.productReviewsNumber) Reviews"
    }
}
