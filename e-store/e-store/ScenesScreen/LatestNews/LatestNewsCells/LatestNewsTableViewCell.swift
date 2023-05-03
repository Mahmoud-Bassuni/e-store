//
//  LatestNewsTableViewCell.swift
//  e-store
//
//  Created by Zeyad on 03/05/2023.
//

import UIKit

class LatestNewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsTitle: UILabel!
    
    @IBOutlet weak var newsDescription: UILabel!
    
    @IBOutlet weak var newsDate: UILabel!
    
    @IBOutlet weak var newsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindCell(latestNewsModel: LatestNewsModel){
        self.newsDate.text = latestNewsModel.newsDate
        self.newsImage.image = latestNewsModel.newsImage
        self.newsTitle.text = latestNewsModel.newsTitle
        self.newsDescription.text = latestNewsModel.newsDesc
    }
    
    
}
