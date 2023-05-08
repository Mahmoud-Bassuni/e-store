//
//  File.swift
//  Shared_UI
//
//  Created by Ahmed Atef on 30/04/2023.
//

import Foundation
import UIKit

// MARK: - Shared button style

class SeeAllButtonStyle: UIButton {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSeeAllButtonStyle()
    }
    
    private func setupSeeAllButtonStyle() {
        titleLabel?.font = UIFont(name: "DMSans-Medium", size: 12)
        setTitleColor(.mediumBlueColor, for: .normal)
    }
}
