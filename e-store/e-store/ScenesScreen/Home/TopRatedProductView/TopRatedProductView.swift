//
//  TopRatedProductView.swift
//  e-store
//
//  Created by Ahmed Atef on 30/04/2023.
//

import UIKit

class TopRatedProductView: UIView {

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
       fromNib(type: TopRatedProductView.self)
    }
}
