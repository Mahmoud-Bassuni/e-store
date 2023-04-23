//
//  FeaturedProductSlider.swift
//  e-store
//
//  Created by Ahmed Atef on 23/04/2023.
//

import UIKit

class FeaturedProductSlider: UIView {
    
    @IBOutlet weak var featuredProductCollectionView: UICollectionView!
    
    var dataSource: [FeaturedProductModel] = []
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        registerCell()
        setupDataSourceList()
        setupFeaturedProductCollectionView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        registerCell()
        setupDataSourceList()
        setupFeaturedProductCollectionView()
    }
    
    private func commonInit() {
        fromNib(type: FeaturedProductSlider.self)
    }
    private func registerCell() {
        featuredProductCollectionView.register(UINib(nibName: FeaturedProductCollectionViewCell.identifier, bundle: nil)
                                               , forCellWithReuseIdentifier: FeaturedProductCollectionViewCell.identifier)
    }
    
    func setupDataSourceList() {
        dataSource = [FeaturedProductModel(productImage: UIImage(named: Asset.airpodsRemovebgPreview.name) ?? UIImage(),
                                           productName: "airpodsRemovebgPreview",
                                           productPrice: 20,
                                           productRate: 4.5,
                                           productReviewsNumber: 20),
                      FeaturedProductModel(productImage: UIImage(named: Asset.airpodsRemovebgPreview.name) ?? UIImage(),
                                                         productName: "airpodsRemovebgPreview",
                                                         productPrice: 20,
                                                         productRate: 4.5,
                                                         productReviewsNumber: 20),
                      FeaturedProductModel(productImage: UIImage(named: Asset.airpodsRemovebgPreview.name) ?? UIImage(),
                                                         productName: "airpodsRemovebgPreview",
                                                         productPrice: 20,
                                                         productRate: 4.5,
                                                         productReviewsNumber: 20),
                      FeaturedProductModel(productImage: UIImage(named: Asset.airpodsRemovebgPreview.name) ?? UIImage(),
                                                         productName: "airpodsRemovebgPreview",
                                                         productPrice: 20,
                                                         productRate: 4.5,
                                                         productReviewsNumber: 20)
        ]
    }
    private func setupFeaturedProductCollectionView() {
        featuredProductCollectionView.dataSource = self
        featuredProductCollectionView.delegate = self
    }
    
}

extension FeaturedProductSlider: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedProductCollectionViewCell.identifier, for: indexPath) as? FeaturedProductCollectionViewCell {
            cell.setupCell(featuredProductModel: dataSource[indexPath.row])
            return cell
        } else {
          return  UICollectionViewCell()
        }
    }
    
    
    
}
extension FeaturedProductSlider: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 2, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}

