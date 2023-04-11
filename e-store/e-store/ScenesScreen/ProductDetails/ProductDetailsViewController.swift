//
//  ProductDetailsViewController.swift
//  e-store
//
//  Created by Ahmed Atef on 09/04/2023.
//

import UIKit
import Shared_UI

class ProductDetailsViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private(set) weak var productImagesCollectionView: UICollectionView!
    @IBOutlet private(set) weak var productName: UILabel!
    @IBOutlet private(set) weak var productPrice: UILabel!
    @IBOutlet private(set) weak var productRate: UILabel!
    @IBOutlet private(set) weak var productReviewsNumber: UILabel!
    // MARK: - Properties
    private var productImages: [UIImage] = []
    private var timer: Timer?
    private var currentIndex: Int = 0
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setupProductImagesCollectionView()
        setupNavigationItems()
        setupProductImagesList()
        setupCollectionViewTimer()
        setupUi()
    }
    
    // MARK: - Functions
    private func setupUi() {
        productPrice.textColor = UIColor.scarletColor
        [productRate, productReviewsNumber, productName].forEach {
            $0?.textColor = UIColor.navyBlackColor
        }
    }
    private func setupProductImagesCollectionView() {
        productImagesCollectionView.dataSource = self
        productImagesCollectionView.delegate = self
    }
    private func registerCell() {
        productImagesCollectionView.register(UINib(nibName: ProductImagesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ProductImagesCollectionViewCell.identifier)
    }
    private func setupProductImagesList() {
        productImages.append(UIImage(named: Asset.applewatchRemovebgPreview.name) ?? UIImage())
        productImages.append(UIImage(named: Asset.headphoneRemovebgPreview.name) ?? UIImage())
        productImages.append(UIImage(named: Asset.airpodsRemovebgPreview.name) ?? UIImage())
        productImages.append(UIImage(named: Asset.flowerRemovebgPreview.name) ?? UIImage())
        productImages.append(UIImage(named: Asset.carRemovebgPreview.name) ?? UIImage())
    }
    private func setupNavigationItems() {
        navigationItem.title = "Detail Product"
        let arrow = UIBarButtonItem(image: UIImage(systemName: "arrowshape.turn.up.right"), style: .plain, target: self, action: #selector(arrowTapped))
        arrow.tintColor = UIColor.black
        let cart = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .plain, target: self, action: #selector(cartTapped))
        [arrow, cart].forEach {
            $0.tintColor = UIColor.navyBlackColor
        }
        navigationItem.rightBarButtonItems = [cart, arrow]
    }
    
    @objc private func arrowTapped() {
        // TODO:- Implement me
    }
    @objc private func cartTapped() {
        // TODO:- Implement me
    }
    private func setupCollectionViewTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(moveToNext), userInfo: nil, repeats: true)
    }
    
    @objc private func moveToNext() {
        currentIndex = (currentIndex < productImages.count - 1) ? (currentIndex + 1) :  0
        productImagesCollectionView.scrollToItem(at: IndexPath(row: currentIndex, section: 0), at: .centeredHorizontally, animated: true)
    }
}
    // MARK: - ProductDetailsViewController extension
extension ProductDetailsViewController: UICollectionViewDataSource {
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
extension ProductDetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}
