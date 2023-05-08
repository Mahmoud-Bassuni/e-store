//
//  FeaturedProductViewModel.swift
//  e-store
//
//  Created by Ahmed Atef on 08/05/2023.
//

import Foundation
import RxSwift
import RxCocoa

class FeaturedProductViewModel {
    
    // MARK: - Properties
    
    let dataSource = BehaviorRelay<[FeaturedProductModel]>(value: [])
    let disposeBag = DisposeBag()
    
    // MARK: - Init

    init() {
        setupDataSourceList()
    }
    
    // MARK: - Functions

    func setupDataSourceList() {
    let dataModel = [FeaturedProductModel(productImageName:  Asset.airpodsRemovebgPreview.name ,
                                              productName: "airpodsRemovebgPreview",
                                              productPrice: 20,
                                              productRate: 4.5,
                                              productReviewsNumber: 20),
                         FeaturedProductModel(productImageName: Asset.carRemovebgPreview.name,
                                              productName: "airpodsRemovebgPreview",
                                              productPrice: 20,
                                              productRate: 4.5,
                                              productReviewsNumber: 20),
                         FeaturedProductModel(productImageName:  Asset.headphoneRemovebgPreview.name,
                                              productName: "airpodsRemovebgPreview",
                                              productPrice: 20,
                                              productRate: 4.5,
                                              productReviewsNumber: 20),
                         FeaturedProductModel(productImageName:  Asset.applewatchRemovebgPreview.name,
                                              productName: "airpodsRemovebgPreview",
                                              productPrice: 20,
                                              productRate: 4.5,
                                              productReviewsNumber: 20)
           ]
        dataSource.accept(dataModel)
    }
}
