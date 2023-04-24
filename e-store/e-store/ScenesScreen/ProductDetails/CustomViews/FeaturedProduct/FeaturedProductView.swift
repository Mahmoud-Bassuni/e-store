//
//  FeaturedProductView.swift
//  e-store
//
//  Created by Ahmed Atef on 23/04/2023.
//

import UIKit

class FeaturedProductView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
       fromNib(type: FeaturedProductView.self)
    }
    
    
    
}
