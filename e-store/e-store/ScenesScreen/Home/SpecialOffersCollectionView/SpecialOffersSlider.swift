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
    
    private let viewModel: SpecialOffersViewModel
    // MARK: - init
    
    init(frame: CGRect, viewModel: SpecialOffersViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
    }
    override init(frame: CGRect) {
        viewModel = SpecialOffersViewModel()
        super.init(frame: frame)
        commonInit()
        registerCell()
        setupFeaturedProductCollectionView()
    }
    
    required init?(coder: NSCoder) {
        viewModel = SpecialOffersViewModel()
        super.init(coder: coder)
        commonInit()
        registerCell()
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
    
    private func setupFeaturedProductCollectionView() {
        specialOffersCollectionView.dataSource = self
        specialOffersCollectionView.delegate = self
    }
}

// MARK: - Extension for data source

extension SpecialOffersSlider: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpecialOffersCollectionViewCell.identifier, for: indexPath) as? SpecialOffersCollectionViewCell {
            cell.setupCell(specialOffersModel: viewModel.dataSource[indexPath.row])
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
