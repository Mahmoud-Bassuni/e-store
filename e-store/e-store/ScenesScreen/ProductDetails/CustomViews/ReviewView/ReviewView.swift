//
//  ReviewView.swift
//  e-store
//
//  Created by Hassan on 19/04/2023.
//

import UIKit

class ReviewView: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var seeAllReviewButton: UIButton!
    
    // MARK: - Properties
    
    var text = ["hassan", "ahmed" , "zeyad"]
    
    // MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        updateUI()

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        updateUI()
    }
    
    func commonInit() {
        fromNib(type: ReviewView.self)
    }
    func updateUI() {
        seeAllReviewButton.selectStyle(style: .whiteButton)
    }

}
