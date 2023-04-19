//
//  ReviewTableViewCell.swift
//  e-store
//
//  Created by Hassan on 19/04/2023.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var mainStack: UIStackView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func calculateHeight()-> Double{
        
        let height = mainStack.layer.frame.height
        print(height)
        return 100
    }
    
}
