//
//  CategoriesCollectionViewCell.swift
//  e-store
//
//  Created by Zeyad on 29/04/2023.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var imageView: UIView!
    static let identifier = String(describing: CategoriesCollectionViewCell.self)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(categoriesModel: CategoriesModel) {
        self.categoryImage.image = categoriesModel.categoryImage
        self.categoryName.text = categoriesModel.categoryName
        self.imageView.backgroundColor =  categoriesModel.imageView
        self.imageView.layer.cornerRadius = 10
    }

}
