//
//  OfferCollectionViewCell.swift
//  e-store
//
//  Created by Hassan on 29/04/2023.
//

import UIKit

class OfferCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var titleOfferLabel: UILabel!
    @IBOutlet weak var descriptionOfferLabel: UILabel!
    @IBOutlet weak var photoOfferImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupCell(title: String,description: String,photo: UIImage) {
        titleOfferLabel.text = title
        descriptionOfferLabel.text = description
        photoOfferImage.image = photo
    }
    func setupUIView() {
        mainView.layer.cornerRadius = 15
        subView.layer.cornerRadius = subView.frame.height / 2
        subView.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner]
    }
}
