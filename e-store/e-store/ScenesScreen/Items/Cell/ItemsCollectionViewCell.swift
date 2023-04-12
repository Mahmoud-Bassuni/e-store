//
//  ItemsCollectionViewCell.swift
//  e-store
//
//  Created by Zeyad on 11/04/2023.
//

import UIKit

class ItemsCollectionViewCell: UICollectionViewCell {
    //MARK: - Outlets
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemImg: UIImageView!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemRating: UILabel!
    @IBOutlet weak var itemReviews: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
