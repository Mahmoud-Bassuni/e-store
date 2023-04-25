//
//  DescriptionView.swift
//  e-store
//
//  Created by Ahmed Atef on 19/04/2023.
//

import UIKit

class DescriptionView: UIView {

    // MARK: - Outlets
    
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var descriptionTextView: UITextView!
    
    // MARK: - properties
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    // MARK: - Life cycle
    
    // MARK: - Functions
    
    private func commonInit() {
        fromNib(type: DescriptionView.self)
    }
}
