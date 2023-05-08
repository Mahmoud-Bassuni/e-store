//
//  ProductDetailsView.swift
//  e-store
//
//  Created by Ahmed Atef on 13/04/2023.
//

import UIKit
import Shared_UI

class ProductDetailsView: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var productImagesCollectionView: UICollectionView!
    @IBOutlet private weak var productName: UILabel!
    @IBOutlet private weak var productPrice: UILabel!
    @IBOutlet private weak var productRate: UILabel!
    @IBOutlet private weak var productReviewsNumber: UILabel!
    
    // MARK: - Properties
    
    private var timer: Timer?
    private var currentIndex: Int = 0
    private let viewModel: ProductDetailsViewModel
    
    // MARK: - Life cycle
     init(frame: CGRect, viewModel: ProductDetailsViewModel) {
         self.viewModel = viewModel
         super.init(frame: frame)
    }
    
    override init(frame: CGRect) {
        self.viewModel = ProductDetailsViewModel()
        super.init(frame: frame)
        commonInit()
        setupUi()
        setupProductImagesCollectionView()
        registerCell()
        setupCollectionViewTimer()
        bindCollectionView()
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = ProductDetailsViewModel()
        super.init(coder: coder)
        commonInit()
        setupUi()
        setupProductImagesCollectionView()
        registerCell()
        setupCollectionViewTimer()
        bindCollectionView()
    }
    
    // MARK: - Functions
    
    private func commonInit() {
        fromNib(type: ProductDetailsView.self)
    }
    
    private func setupUi() {
        productPrice.textColor = UIColor.scarletColor
        [productRate, productReviewsNumber, productName].forEach {
            $0?.textColor = UIColor.navyBlackColor
        }
        productImagesCollectionView.layer.cornerRadius = 10
    }
    
    private  func setupProductImagesCollectionView() {
        productImagesCollectionView.delegate = self
    }
    
    private func registerCell() {
        productImagesCollectionView.register(UINib(nibName: ProductImagesCollectionViewCell.identifier, bundle: nil)
                                             , forCellWithReuseIdentifier: ProductImagesCollectionViewCell.identifier)
    }
    
    private func setupCollectionViewTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2, target: self,
                                     selector: #selector(moveToNext),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc private func moveToNext() {
        currentIndex = (currentIndex < viewModel.dataSource.value.count - 1) ? (currentIndex + 1) :  0
        productImagesCollectionView.scrollToItem(at: IndexPath(row: currentIndex, section: 0),
                                                 at: .centeredHorizontally,
                                                 animated: true)
    }
}

// MARK: - ProductDetailsView extension

extension ProductDetailsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}

extension ProductDetailsView {
    private func bindCollectionView() {
        viewModel.dataSource.bind(to: productImagesCollectionView
            .rx
            .items(cellIdentifier: ProductImagesCollectionViewCell.identifier, cellType: ProductImagesCollectionViewCell.self)) { indexPath, data, cell in
            cell.setupCell(productImageName: data,
                           imagesCounter: indexPath + 1,
                           totalImagesNumber: self.viewModel.dataSource.value.count)
            
        }
    }
}
