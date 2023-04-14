//
//  Item.swift
//  e-store
//
//  Created by Zeyad on 11/04/2023.
//

import Foundation

class CategoryItem {
    var img:ImageAsset
    var name: String
    var price: Int
    var rating: Float
    var reviews: Int
    
    init(img: ImageAsset, name: String, price: Int, rating: Float, reviews: Int) {
        self.img = img
        self.name = name
        self.price = price
        self.rating = rating
        self.reviews = reviews
    }
}
