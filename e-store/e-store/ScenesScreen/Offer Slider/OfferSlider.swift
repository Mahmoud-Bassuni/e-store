//
//  OfferSlider.swift
//  e-store
//
//  Created by Hassan on 29/04/2023.
//

import UIKit

class OfferSlider: UIView {
    // MARK: - Outlets
    
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var offerCollectionView: UICollectionView!
//    @IBOutlet private weak var productName: UILabel!
//    @IBOutlet private weak var productPrice: UILabel!
//    @IBOutlet private weak var productRate: UILabel!
//    @IBOutlet private weak var productReviewsNumber: UILabel!
    
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
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        setupUi()
        setupProductImagesCollectionView()
        registerCell()
    }
    
    // MARK: - Functions
    
    private func commonInit() {
        fromNib(type: OfferSlider.self)
    }
    
    private func setupUi() {
//        productPrice.textColor = UIColor.scarletColor
//        [productRate, productReviewsNumber, productName].forEach {
//            $0?.textColor = UIColor.navyBlackColor
//        }
//        productImagesCollectionView.layer.cornerRadius = 10
    }
    
    private  func setupProductImagesCollectionView() {
        offerCollectionView.dataSource = self
        offerCollectionView.delegate = self
    }
    
    private func registerCell() {
        offerCollectionView.register(UINib(nibName: "OfferCollectionViewCell", bundle: nil)
                                             , forCellWithReuseIdentifier: "OfferCollectionViewCell")
        setupProductImagesList()
    }
    
    func setupProductImagesList() {
        productImages.append(UIImage(named: Asset.applewatchRemovebgPreview.name) ?? UIImage())
        productImages.append(UIImage(named: Asset.headphoneRemovebgPreview.name) ?? UIImage())
        productImages.append(UIImage(named: Asset.airpodsRemovebgPreview.name) ?? UIImage())
        productImages.append(UIImage(named: Asset.flowerRemovebgPreview.name) ?? UIImage())
        productImages.append(UIImage(named: Asset.carRemovebgPreview.name) ?? UIImage())
    }
     
}

// MARK: - ProductDetailsView extension

extension OfferSlider: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        productImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "OfferCollectionViewCell",
            for: indexPath) as? OfferCollectionViewCell {
//            cell.setupCell(productImage: productImages[indexPath.row],
//                           imagesCounter: indexPath.row + 1,
//                           totalImagesNumber: productImages.count)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}
extension OfferSlider: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        15
    }
}
