//
//  ShowUserData.swift
//  e-store
//
//  Created by Hassan on 20/03/2023.
//

import UIKit

class ShowUserData: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var idEamilStack: UIStackView!
    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var passLbl: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var idLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
