//
//  SpecialOffersView.swift
//  e-store
//
//  Created by Ahmed Atef on 01/05/2023.
//

import UIKit

class SpecialOffersView: UIView {
    
    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    // MARK: - Functions

    private func commonInit() {
       fromNib(type: SpecialOffersView.self)
    }
}
