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
    
    // MARK: - Properties
    
    private var itemsOffer: [OfferModel] = []
    
    // MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setupProductImagesCollectionView()
        registerCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        setupProductImagesCollectionView()
        registerCell()
    }
    
    // MARK: - Functions
    
    private func commonInit() {
        fromNib(type: OfferSlider.self)
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
        itemsOffer.append(OfferModel(title: "Gatis Ongkir Selama PPKM!", description: "Periode Mei - Agustus 2021"))
        itemsOffer.append(OfferModel(title: "Gatis Ongkir Selama PPKM!", description: "Periode Mei - Agustus 2021"))
        itemsOffer.append(OfferModel(title: "Gatis Ongkir Selama PPKM!", description: "Periode Mei - Agustus 2021"))
    }
     
}

// MARK: - ProductDetailsView extension

extension OfferSlider: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        itemsOffer.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "OfferCollectionViewCell",
            for: indexPath) as? OfferCollectionViewCell {
            let item = itemsOffer[indexPath.row]
            cell.setupCell(title: item.title, description: item.description, photo: item.photo)
            cell.setupUIView()
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
