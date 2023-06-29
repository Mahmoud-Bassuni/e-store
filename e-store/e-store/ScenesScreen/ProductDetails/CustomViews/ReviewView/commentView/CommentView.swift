//
//  CommentView.swift
//  e-store
//
//  Created by Hassan on 29/06/2023.
//
import UIKit

class CommentView: UIView {
    
    // MARK: - Outlets
    @IBOutlet weak var ratingLabel     :UILabel!
    @IBOutlet weak var durationLabel   :UILabel!
    @IBOutlet weak var fullNameLabel   :UILabel!
    @IBOutlet weak var avatarImage     :UIImageView!
    @IBOutlet weak var commentBodyLabel:UILabel!
    // MARK: - Properties
    var text = ["hassan",
                "ahmed" ,
                "ziad"]
    
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
        fromNib(type: CommentView.self)
    }
    func updateUI(image:UIImage? = UIImage(named: "avatar") ,name:String = "Yelena Belova",duration:String = "2 Minggu yang lalu",rating:String = "⭐️⭐️⭐️⭐️☆") {
        
        avatarImage.image = image
        commentBodyLabel.text = text.randomElement()
        durationLabel.text = duration
        ratingLabel.text = rating
        fullNameLabel.text = name
            
        }

}
