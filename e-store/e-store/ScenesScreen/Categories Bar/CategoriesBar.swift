//
//  CategoriesBar.swift
//  e-store
//
//  Created by Zeyad on 27/04/2023.
//

import UIKit

class CategoriesBar: UIView {

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
       fromNib(type: CategoriesBar.self)
    }
}
