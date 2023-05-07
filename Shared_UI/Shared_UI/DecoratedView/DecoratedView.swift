//
//  DecoratedView.swift
//  Shared_UI
//
//  Created by Ahmed Atef on 24/04/2023.
//

import Foundation
import UIKit

class DecoratedView: UIView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        layer.cornerRadius = 10
        layer.masksToBounds = true
        backgroundColor = UIColor.white
        layer.shadowColor = UIColor.lightBlack.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 1)
        
    }
}
