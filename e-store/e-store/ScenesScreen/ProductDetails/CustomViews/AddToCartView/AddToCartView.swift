//
//  AddToCartView.swift
//  e-store
//
//  Created by Ahmed Atef on 24/04/2023.
//

import UIKit
import Shared_UI

class AddToCartView: UIView {
    @IBOutlet weak var addedButton: UIButton!
    @IBOutlet weak var addToCartButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setupButtons()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        setupButtons()
    }
    
    private func commonInit() {
        fromNib(type: AddToCartView.self)
    }
    
    private func setupButtons() {
        addedButton.selectStyle(style: .redButton)
        addToCartButton.selectStyle(style: .blueButton)
    }
    
}
