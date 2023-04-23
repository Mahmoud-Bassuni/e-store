//
//  FeaturedProductSlider.swift
//  e-store
//
//  Created by Ahmed Atef on 23/04/2023.
//

import UIKit

class FeaturedProductSlider: UIView {
    
    @IBOutlet weak var featuredProductCollectionView: UICollectionView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        registerCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        registerCell()
    }
    
    private func commonInit() {
        fromNib(type: FeaturedProductSlider.self)
    }
    private func registerCell() {
        featuredProductCollectionView.register(UINib(nibName: FeaturedProductCollectionViewCell.identifier, bundle: nil)
                                               , forCellWithReuseIdentifier: FeaturedProductCollectionViewCell.identifier)
    }
    
}
