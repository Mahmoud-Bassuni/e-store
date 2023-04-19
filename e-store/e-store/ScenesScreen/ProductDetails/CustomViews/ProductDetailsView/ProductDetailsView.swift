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
    
    private var productImages: [UIImage] = []
    private var timer: Timer?
    private var currentIndex: Int = 0
    
    // MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setupUi()
        setupProductImagesCollectionView()
        registerCell()
        setupCollectionViewTimer()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        setupUi()
        setupProductImagesCollectionView()
        registerCell()
        setupCollectionViewTimer()
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
        productImagesCollectionView.dataSource = self
        productImagesCollectionView.delegate = self
    }
    
    private func registerCell() {
        productImagesCollectionView.register(UINib(nibName: ProductImagesCollectionViewCell.identifier, bundle: nil)
                                             , forCellWithReuseIdentifier: ProductImagesCollectionViewCell.identifier)
    }
    
    func setupProductImagesList() {
        productImages.append(UIImage(named: Asset.applewatchRemovebgPreview.name) ?? UIImage())
        productImages.append(UIImage(named: Asset.headphoneRemovebgPreview.name) ?? UIImage())
        productImages.append(UIImage(named: Asset.airpodsRemovebgPreview.name) ?? UIImage())
        productImages.append(UIImage(named: Asset.flowerRemovebgPreview.name) ?? UIImage())
        productImages.append(UIImage(named: Asset.carRemovebgPreview.name) ?? UIImage())
    }
    
    private func setupCollectionViewTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2, target: self,
                                     selector: #selector(moveToNext),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc private func moveToNext() {
        currentIndex = (currentIndex < productImages.count - 1) ? (currentIndex + 1) :  0
        productImagesCollectionView.scrollToItem(at: IndexPath(row: currentIndex, section: 0),
                                                 at: .centeredHorizontally,
                                                 animated: true)
    }
}

// MARK: - ProductDetailsView extension

extension ProductDetailsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        productImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ProductImagesCollectionViewCell.identifier,
            for: indexPath) as? ProductImagesCollectionViewCell {
            cell.setupCell(productImage: productImages[indexPath.row],
                           imagesCounter: indexPath.row + 1,
                           totalImagesNumber: productImages.count)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}
extension ProductDetailsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}
