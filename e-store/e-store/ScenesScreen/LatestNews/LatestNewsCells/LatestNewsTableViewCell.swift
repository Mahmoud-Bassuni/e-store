//
//  LatestNewsTableViewCell.swift
//  e-store
//
//  Created by Zeyad on 03/05/2023.
//

import UIKit
import Shared_UI

class LatestNewsTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var newsTitle: UILabel!
    
    @IBOutlet private weak var newsDescription: UILabel!
    
    @IBOutlet private weak var newsDate: UILabel!
    
    @IBOutlet private weak var newsImage: UIImageView!
    
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
        newsImage.setImage(for: latestNewsModel.newsImageURL, placeHolderImage: UIImage(named: "avatar") ?? UIImage())
        self.newsTitle.text = latestNewsModel.newsTitle
        self.newsDescription.text = latestNewsModel.newsDesc
    }
    
    
}
