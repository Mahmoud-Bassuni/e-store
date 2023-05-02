//
//  ItemsCollectionViewCell.swift
//  e-store
//
//  Created by Zeyad on 11/04/2023.
//

import UIKit
import Shared_UI

class ItemsCollectionViewCell: UICollectionViewCell {
    // MARK: - Outlets
    @IBOutlet private weak var itemName: UILabel!
    @IBOutlet private weak var itemImg: UIImageView!
    @IBOutlet private weak var itemPrice: UILabel!
    @IBOutlet private weak var itemRating: UILabel!
    @IBOutlet private weak var itemReviews: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func bindOutlets(product: CategoryItem) {
        itemName.text = product.name
        itemImg.setImage(for: product.imgURL, placeHolderImage: UIImage(named: "airPods1") ?? UIImage())
        itemName.text = product.name
        itemPrice.text = "Rp. "+String(product.price)
        itemReviews.text = String(product.reviews) + " Reviews"
        itemRating.text = "⭐️ " + String(product.rating)
    }
}
