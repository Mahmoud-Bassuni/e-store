//
//  FeaturedProductSlider.swift
//  e-store
//
//  Created by Ahmed Atef on 23/04/2023.
//

import UIKit
import RxSwift
import RxCocoa

class FeaturedProductSlider: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var featuredProductCollectionView: UICollectionView!
    
    // MARK: - Properties
    
    private let viewModel: FeaturedProductViewModel
    
    // MARK: - init
    
    init(frame: CGRect, viewModel: FeaturedProductViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
    }
    
    override init(frame: CGRect) {
        self.viewModel = FeaturedProductViewModel()
        super.init(frame: frame)
        commonInit()
        registerCell()
        setupFeaturedProductCollectionView()
        bindFeaturedProductCollectionView()
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = FeaturedProductViewModel()
        super.init(coder: coder)
        commonInit()
        registerCell()
        
        setupFeaturedProductCollectionView()
        bindFeaturedProductCollectionView()
    }
    
    // MARK: - Functions
    
    private func commonInit() {
        fromNib(type: FeaturedProductSlider.self)
    }
    private func registerCell() {
        featuredProductCollectionView.register(UINib(nibName: FeaturedProductCollectionViewCell.identifier, bundle: nil)
                                               , forCellWithReuseIdentifier: FeaturedProductCollectionViewCell.identifier)
    }
    
    private func setupFeaturedProductCollectionView() {
        featuredProductCollectionView.delegate = self
    }
}

// MARK: - Extension for delegate

extension FeaturedProductSlider: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 2, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        15
    }
}

// MARK: - Bind View Model
extension FeaturedProductSlider {
    func bindFeaturedProductCollectionView() {
        viewModel.dataSource
            .bind(to: featuredProductCollectionView
                .rx
                .items(cellIdentifier: FeaturedProductCollectionViewCell.identifier,
                       cellType: FeaturedProductCollectionViewCell.self)) { _, model, cell in
                cell.setupCell(featuredProductModel: model)
            }.disposed(by: viewModel.disposeBag)
    }
}
