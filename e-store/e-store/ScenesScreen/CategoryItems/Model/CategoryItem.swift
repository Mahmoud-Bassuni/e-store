//
//  Item.swift
//  e-store
//
//  Created by Zeyad on 11/04/2023.
//

import Foundation
import UIKit
import Kingfisher

class CategoryItem {
    var imgURL: String
    var name: String
    var price: Int
    var rating: Float
    var reviews: Int
    
    init(img: String, name: String, price: Int, rating: Float, reviews: Int) {
        
        self.imgURL = img
        self.name = name
        self.price = price
        self.rating = rating
        self.reviews = reviews
    }
}
