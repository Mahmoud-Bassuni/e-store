//
//  OfferBanner.swift
//  e-store
//
//  Created by Hassan on 01/05/2023.
//

import UIKit

class OfferBanner: UIView {
    
    // MARK: - Outlets
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var offerImage: UIImageView!
    @IBOutlet private weak var offerName: UILabel!
    
    // MARK: - Properties
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        updateViewUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        updateViewUI()
    }
    // MARK: - Lify cycle
    
    // MARK: - Functions
    private func commonInit() {
        fromNib(type: OfferBanner.self)
    }
    private func updateViewUI() {
        contentView.layer.cornerRadius = 10
    }
}
