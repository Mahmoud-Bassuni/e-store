//
//  ItemsCollectionViewCell.swift
//  e-store
//
//  Created by Zeyad on 11/04/2023.
//

import UIKit

class ItemsCollectionViewCell: UICollectionViewCell {
    //MARK: - Outlets
    @IBOutlet private weak var itemName: UILabel!
    @IBOutlet private weak var itemImg: UIImageView!
    @IBOutlet private weak var itemPrice: UILabel!
    @IBOutlet private weak var itemRating: UILabel!
    @IBOutlet private weak var itemReviews: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setupOutlets(product: Item){
        itemName.text = product.name
        itemImg.image = product.img.image
        itemName.text = product.name
        itemPrice.text = "Rp. "+String(product.price)
        itemReviews.text = String(product.reviews) + " Reviews"
        itemRating.text = "⭐️ " + String(product.rating)
    }
}
