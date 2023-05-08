//
//  SpecialOffersViewModel.swift
//  e-store
//
//  Created by Ahmed Atef on 08/05/2023.
//

import Foundation
class SpecialOffersViewModel {
    
    // MARK: - Properties
    
    var dataSource: [SpecialOffersModel] = []
    
    // MARK: - Init

    init() {
        setupDataSourceList()
    }
    
    // MARK: - Functions

    private func setupDataSourceList() {
        dataSource = [SpecialOffersModel(productImageName:  Asset.airpodsRemovebgPreview.name,
                                         productName: "airpodsRemovebgPreview",
                                         productPrice: 1500000,
                                         productPriceBeforeOffer: 100000,
                                         productRate: 4.5,
                                         productReviewsNumber: 20),
                      SpecialOffersModel(productImageName: Asset.carRemovebgPreview.name,
                                         productName: "airpodsRemovebgPreview",
                                         productPrice: 20, productPriceBeforeOffer: 80,
                                         productRate: 4.5,
                                         productReviewsNumber: 20),
                      SpecialOffersModel(productImageName: Asset.headphoneRemovebgPreview.name,
                                         productName: "airpodsRemovebgPreview",
                                         productPrice: 20, productPriceBeforeOffer: 90,
                                         productRate: 4.5,
                                         productReviewsNumber: 20),
                      SpecialOffersModel(productImageName: Asset.applewatchRemovebgPreview.name,
                                         productName: "airpodsRemovebgPreview",
                                         productPrice: 20, productPriceBeforeOffer: 99,
                                         productRate: 4.5,
                                         productReviewsNumber: 20)
        ]
    }
}
