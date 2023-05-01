//
//  SpecialOffersSlider.swift
//  e-store
//
//  Created by Ahmed Atef on 01/05/2023.
//

import UIKit

class SpecialOffersSlider: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var specialOffersCollectionView: UICollectionView!
    
    // MARK: - Properties
    
    var dataSource: [SpecialOffersModel] = []
    
    // MARK: - init
    
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
    
    // MARK: - Functions
    
    private func commonInit() {
        fromNib(type: SpecialOffersSlider.self)
    }
    private func registerCell() {
        specialOffersCollectionView.register(UINib(nibName: SpecialOffersCollectionViewCell.identifier, bundle: nil)
                                             , forCellWithReuseIdentifier: SpecialOffersCollectionViewCell.identifier)
    }
    
    func setupDataSourceList() {
        dataSource = [SpecialOffersModel(productImage: UIImage(named: Asset.airpodsRemovebgPreview.name) ?? UIImage(),
                                         productName: "airpodsRemovebgPreview",
                                         productPrice: 1500000,
                                         productPriceBeforeOffer: 100000,
                                         productRate: 4.5,
                                         productReviewsNumber: 20),
                      SpecialOffersModel(productImage: UIImage(named: Asset.carRemovebgPreview.name) ?? UIImage(),
                                         productName: "airpodsRemovebgPreview",
                                         productPrice: 20, productPriceBeforeOffer: 80,
                                         productRate: 4.5,
                                         productReviewsNumber: 20),
                      SpecialOffersModel(productImage: UIImage(named: Asset.headphoneRemovebgPreview.name) ?? UIImage(),
                                         productName: "airpodsRemovebgPreview",
                                         productPrice: 20, productPriceBeforeOffer: 90,
                                         productRate: 4.5,
                                         productReviewsNumber: 20),
                      SpecialOffersModel(productImage: UIImage(named: Asset.applewatchRemovebgPreview.name) ?? UIImage(),
                                         productName: "airpodsRemovebgPreview",
                                         productPrice: 20, productPriceBeforeOffer: 99,
                                         productRate: 4.5,
                                         productReviewsNumber: 20)
        ]
    }
    private func setupFeaturedProductCollectionView() {
        specialOffersCollectionView.dataSource = self
        specialOffersCollectionView.delegate = self
    }
}

// MARK: - Extension for data source

extension SpecialOffersSlider: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpecialOffersCollectionViewCell.identifier, for: indexPath) as? SpecialOffersCollectionViewCell {
            cell.setupCell(specialOffersModel: dataSource[indexPath.row])
            return cell
        } else {
            return  UICollectionViewCell()
        }
    }
}

// MARK: - Extension for delegate

extension SpecialOffersSlider: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 2, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        15
    }
}
