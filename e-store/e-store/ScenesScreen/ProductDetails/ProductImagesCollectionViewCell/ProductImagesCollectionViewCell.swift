//
//  ProductImagesCollectionViewCell.swift
//  e-store
//
//  Created by Ahmed Atef on 09/04/2023.
//

import UIKit

class ProductImagesCollectionViewCell: UICollectionViewCell {
    // MARK: - Outlets
    @IBOutlet private weak var productImage: UIImageView!
    @IBOutlet private weak var imagesCounter: UILabel!
    @IBOutlet private weak var totalImagesNumber: UILabel!
    
    // MARK: - Properties
    static let identifier = String(describing: ProductImagesCollectionViewCell.self)
    
    // MARK: - Functions
    func setupCell(productImage: UIImage, imagesCounter: Int, totalImagesNumber: Int) {
        self.productImage.image = productImage
        self.imagesCounter.text = "\(imagesCounter)"
        self.totalImagesNumber.text = "/\(totalImagesNumber)"
    }
    
}