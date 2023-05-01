//
//  SpecialOffersCollectionViewCell.swift
//  e-store
//
//  Created by Ahmed Atef on 01/05/2023.
//

import UIKit

class SpecialOffersCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets

    @IBOutlet private weak var specialOfferView: UIView!
    @IBOutlet private weak var productImage: UIImageView!
    @IBOutlet private weak var saleLabel: UILabel!
    @IBOutlet private weak var productName: UILabel!
    @IBOutlet private weak var productPrice: UILabel!
    @IBOutlet private weak var productPriceBeforeOffer: UILabel!
    @IBOutlet private weak var productRate: UILabel!
    @IBOutlet private weak var productReviewsNumber: UILabel!
    
    // MARK: - Properties

    static let identifier = String(describing: SpecialOffersCollectionViewCell.self)
    
    // MARK: - Functions
    override func layoutSubviews() {
        setupUi()
        
    }

    func setupCell(specialOffersModel: SpecialOffersModel) {
        self.productImage.image = specialOffersModel.productImage
        self.productName.text = specialOffersModel.productName
        self.productPrice.text = "\(specialOffersModel.productPrice)"
        self.productPriceBeforeOffer.text = "\(specialOffersModel.productPriceBeforeOffer)"
        self.productRate.text = "\(specialOffersModel.productRate)"
        self.productReviewsNumber.text = "\(specialOffersModel.productReviewsNumber) Reviews"
    }
    
    private func setupUi() {
        setupLabelsTextColor()
        setupSaleLabel()
    }
    private func setupLabelsTextColor() {
        productPrice.textColor = UIColor.scarletColor
        [productRate, productReviewsNumber, productName].forEach {
            $0?.textColor = UIColor.navyBlackColor
        }
    }
    
    private func setupSaleLabel() {
        saleLabel.backgroundColor = .scarletColor
        saleLabel.layer.cornerRadius = 10
        saleLabel.layer.masksToBounds = true
    }
}
