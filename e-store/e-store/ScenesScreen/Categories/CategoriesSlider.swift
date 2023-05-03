//
//  CategoriesSlider.swift
//  e-store
//
//  Created by Zeyad on 27/04/2023.
//

import UIKit

class CategoriesSlider: UIView {
    
    
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    var dataSource: [CategoriesModel] = []
    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        registerCell()
        setupCategoriesCollectionView()
        setupDataSourceList()
        let layout = UICollectionViewFlowLayout()
                layout.scrollDirection = .horizontal
                categoriesCollectionView.collectionViewLayout = layout
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        registerCell()
        setupCategoriesCollectionView()
        setupDataSourceList()
        let layout = UICollectionViewFlowLayout()
                layout.scrollDirection = .horizontal
                categoriesCollectionView.collectionViewLayout = layout
    }
    // MARK: - Functions

    private func commonInit() {
       fromNib(type: CategoriesSlider.self)
    }
    
    private func registerCell() {
        categoriesCollectionView.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil)
                                               , forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
    }
    
    func setupDataSourceList() {
        dataSource = [CategoriesModel(categoryImage:
                                        UIImage(systemName: "carrot")?.withTintColor(.green,renderingMode: .alwaysOriginal) ?? UIImage(), categoryName: "Food", imageView: UIColor.lightGreenColor),
                      CategoriesModel(categoryImage: UIImage(systemName: "gift")?.withTintColor(.red,renderingMode: .alwaysOriginal) ?? UIImage(),
                                      categoryName: "Gift", imageView: UIColor.lightRedColor),
                      
                      CategoriesModel(categoryImage:
                                        UIImage(systemName: "tshirt")?.withTintColor(.orange,renderingMode: .alwaysOriginal) ?? UIImage(),
                                      categoryName: "Fashion", imageView: UIColor.lightYellowColor),
                      CategoriesModel(categoryImage:
                                        UIImage(systemName: "airpodspro")?.withTintColor(.purple,renderingMode: .alwaysOriginal) ?? UIImage(),
                                      categoryName: "Gadget",  imageView: UIColor.lightPurpleColor),
                      CategoriesModel(categoryImage:
                                        UIImage(systemName: "laptopcomputer")?.withTintColor(.green,renderingMode: .alwaysOriginal) ?? UIImage(),
                                      categoryName: "Computer",  imageView: UIColor.lightGreenColor),
                      CategoriesModel(categoryImage:
                                        UIImage(systemName: "giftcard")?.withTintColor(.purple,renderingMode: .alwaysOriginal) ?? UIImage(),
                                      categoryName: "Souvenir",  imageView: UIColor.lightRedColor)
                      
        ]
        
    }
    private func setupCategoriesCollectionView() {
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
    }
    
}

// MARK: - Extension for data source

extension CategoriesSlider: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as? CategoriesCollectionViewCell {
            cell.setupCell(categoriesModel: dataSource[indexPath.row])
            return cell
        } else {
          return  UICollectionViewCell()
        }
    }
}

extension CategoriesSlider: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 5, height: collectionView.frame.height)
    }
    
}

