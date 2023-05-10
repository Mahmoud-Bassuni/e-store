//
//  OfferSliderViewModel.swift
//  e-store
//
//  Created by Hassan on 09/05/2023.
//

import Foundation
class OfferViewModel {
    // MARK: - Properties
    
    var itemsOffer: [OfferModel] = []
    
    // MARK: - Init
    init() {
        setupProductImagesList()
    }
    
    // MARK: - Functions
    func setupProductImagesList() {
        itemsOffer.append(OfferModel(title: "Gatis Ongkir Selama PPKM!", description: "Periode Mei - Agustus 2021"))
        itemsOffer.append(OfferModel(title: "Gatis Ongkir Selama PPKM!", description: "Periode Mei - Agustus 2021"))
        itemsOffer.append(OfferModel(title: "Gatis Ongkir Selama PPKM!", description: "Periode Mei - Agustus 2021"))
    }
}
