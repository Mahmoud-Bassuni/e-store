//
//  SellerInformationView.swift
//  e-store
//
//  Created by Ahmed Atef on 19/04/2023.
//

import UIKit
import Shared_UI

class SellerInformationView: UIView {
    
    // MARK: - Outlets
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var shopImage: UIImageView!
    @IBOutlet private weak var shopName: UILabel!
    
    // MARK: - Properties
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setupShopImage()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        setupShopImage()
    }
    // MARK: - Lify cycle
    
    // MARK: - Functions
    private func commonInit() {
        Bundle.main.loadNibNamed("SellerInformationView", owner: self)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    private func setupShopImage() {
        shopImage.makeRounded()
    }
}
