//
//  CategoryItem.swift
//  e-store
//
//  Created by Zeyad on 02/05/2023.
//

import Foundation
import UIKit

class CategoryItem{
    var imgURL: String
    var name: String
    var price: Double
    var rating: Float
    var reviews: Int
    
    init(img: String, name: String, price: Double, rating: Float, reviews: Int) {
        self.imgURL = img
        self.name = name
        self.price = price
        self.rating = rating
        self.reviews = reviews
    }
}
