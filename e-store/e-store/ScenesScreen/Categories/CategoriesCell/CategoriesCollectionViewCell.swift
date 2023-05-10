//
//  CategoriesCollectionViewCell.swift
//  e-store
//
//  Created by Zeyad on 29/04/2023.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var categoryImage: UIImageView!
    @IBOutlet private weak var categoryName: UILabel!
    @IBOutlet private weak var categoryImageView: UIView!
    static let identifier = String(describing: CategoriesCollectionViewCell.self)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(categoriesModel: CategoriesModel) {
        self.categoryImage.image = categoriesModel.categoryImage
        self.categoryName.text = categoriesModel.categoryName
        self.categoryImageView.backgroundColor =  categoriesModel.categoriesImageView
        self.categoryImageView.layer.cornerRadius = 10
    }

}
