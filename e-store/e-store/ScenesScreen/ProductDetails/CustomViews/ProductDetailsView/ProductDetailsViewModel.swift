//
//  ProductDetailsViewModel.swift
//  e-store
//
//  Created by Ahmed Atef on 08/05/2023.
//

import Foundation
import RxCocoa

class ProductDetailsViewModel {
    
    // MARK: - Properties
    
    let dataSource = BehaviorRelay<[String]>(value: [])
    
    // MARK: - Init

    init() {
        setupProductImagesList()
    }
    
    // MARK: - Functions

    func setupProductImagesList() {
        let imagesName = [Asset.applewatchRemovebgPreview.name,
                          Asset.headphoneRemovebgPreview.name,
                          Asset.airpodsRemovebgPreview.name,
                          Asset.flowerRemovebgPreview.name,
                          Asset.carRemovebgPreview.name]
        dataSource.accept(imagesName)
    }
    
}
