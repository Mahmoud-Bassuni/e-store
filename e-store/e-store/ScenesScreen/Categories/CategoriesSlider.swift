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
    var viewModel: CategoriesViewModel
    // MARK: - init

    init(viewModel: CategoriesViewModel) {
        self.viewModel = viewModel
        super.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        self.viewModel = CategoriesViewModel()
        super.init(frame: frame)
        commonInit()
        registerCell()
        setupCategoriesCollectionView()
        dataSource = viewModel.setUpDataSourceList()
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = CategoriesViewModel()
        super.init(coder: coder)
        commonInit()
        registerCell()
        setupCategoriesCollectionView()
        dataSource = viewModel.setUpDataSourceList()
        setUpLayout()
    }
    // MARK: - Functions

    private func commonInit() {
       fromNib(type: CategoriesSlider.self)
    }
    
    private func registerCell() {
        categoriesCollectionView.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil)
                                               , forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
    }
    
    private func setupCategoriesCollectionView() {
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
    }
    
    private func setUpLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        categoriesCollectionView.collectionViewLayout = layout
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
