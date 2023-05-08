//
//  FeaturedProductCollectionViewCell.swift
//  e-store
//
//  Created by Ahmed Atef on 23/04/2023.
//

import UIKit

class FeaturedProductCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets

    @IBOutlet private weak var productImage: UIImageView!
    @IBOutlet private weak var productName: UILabel!
    @IBOutlet private weak var productPrice: UILabel!
    @IBOutlet private weak var productRate: UILabel!
    @IBOutlet private weak var productReviewsNumber: UILabel!
    
    // MARK: - Properties

    static let identifier = String(describing: FeaturedProductCollectionViewCell.self)
    
    // MARK: - Functions
    override func layoutSubviews() {
        setupUi()
    }

    func setupCell(featuredProductModel: FeaturedProductModel) {
        self.productImage.image = UIImage(named: featuredProductModel.productImageName)
        self.productName.text = featuredProductModel.productName
        self.productPrice.text = "\(featuredProductModel.productPrice)"
        self.productRate.text = "\(featuredProductModel.productRate)"
        self.productReviewsNumber.text = "\(featuredProductModel.productReviewsNumber) Reviews"
    }
    
    private func setupUi() {
        productPrice.textColor = UIColor.scarletColor
        [productRate, productReviewsNumber, productName].forEach {
            $0?.textColor = UIColor.navyBlackColor
        }
    }
}
