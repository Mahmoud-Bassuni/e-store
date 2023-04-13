//
//  ProductDetailsView.swift
//  e-store
//
//  Created by Ahmed Atef on 13/04/2023.
//

import UIKit

class ProductDetailsView: UIView {
    
    // MARK: - Outlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var productImagesCollectionView: UICollectionView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productRate: UILabel!
    @IBOutlet weak var productReviewsNumber: UILabel!
    
    // MARK: - Properties
    
    static let nibName = String(describing: ProductDetailsView.self)
    private var productImages: [UIImage] = []
    private var timer: Timer?
    private var currentIndex: Int = 0
    
    // MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    // MARK: - Functions
    
    func commonInit() {
        Bundle.main.loadNibNamed(ProductDetailsView.nibName, owner: self)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func setupUi() {
        productPrice.textColor = UIColor.scarletColor
        [productRate, productReviewsNumber, productName].forEach {
            $0?.textColor = UIColor.navyBlackColor
        }
    }
    
    func setupProductImagesCollectionView() {
        productImagesCollectionView.dataSource = self
        productImagesCollectionView.delegate = self
    }
    
    func registerCell() {
        productImagesCollectionView.register(UINib(nibName: ProductImagesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ProductImagesCollectionViewCell.identifier)
    }
    
    func setupProductImagesList() {
        productImages.append(UIImage(named: Asset.applewatchRemovebgPreview.name) ?? UIImage())
        productImages.append(UIImage(named: Asset.headphoneRemovebgPreview.name) ?? UIImage())
        productImages.append(UIImage(named: Asset.airpodsRemovebgPreview.name) ?? UIImage())
        productImages.append(UIImage(named: Asset.flowerRemovebgPreview.name) ?? UIImage())
        productImages.append(UIImage(named: Asset.carRemovebgPreview.name) ?? UIImage())
    }
    
    func setupCollectionViewTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(moveToNext), userInfo: nil, repeats: true)
    }
    
    @objc private func moveToNext() {
        currentIndex = (currentIndex < productImages.count - 1) ? (currentIndex + 1) :  0
        productImagesCollectionView.scrollToItem(at: IndexPath(row: currentIndex, section: 0), at: .centeredHorizontally, animated: true)
    }
}

// MARK: - ProductDetailsView extension

extension ProductDetailsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        productImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductImagesCollectionViewCell.identifier, for: indexPath) as? ProductImagesCollectionViewCell {
            cell.setupCell(productImage: productImages[indexPath.row], imagesCounter: indexPath.row + 1, totalImagesNumber: productImages.count)
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
