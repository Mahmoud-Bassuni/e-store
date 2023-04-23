//
//  ReviewTableViewCell.swift
//  e-store
//
//  Created by Hassan on 19/04/2023.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var commentBodyLabel: UILabel!
    
    // MARK: - Life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func setupCell(image:UIImage? = UIImage(named: "avatar") ,name:String = "Yelena Belova",duration:String = "2 Minggu yang lalu",rating:String = "⭐️⭐️⭐️⭐️☆",comment:String) {
           
        avatarImage.image = image
        commentBodyLabel.text = comment
        durationLabel.text = duration
        ratingLabel.text = rating
        fullNameLabel.text = name
            
        }
    
}
