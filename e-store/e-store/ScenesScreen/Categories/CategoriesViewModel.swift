//
//  CategoriesViewModel.swift
//  e-store
//
//  Created by Zeyad on 07/05/2023.
//

import Foundation
import UIKit

class CategoriesViewModel {
    func setUpDataSourceList() -> [CategoriesModel] {
        return [CategoriesModel(categoryImage:
                                    "https://m.media-amazon.com/images/I/61SUj2aKoEL._AC_SL1500_.jpg", categoryName: "Food", categoriesImageView: UIColor.lightGreenColor),
                          CategoriesModel(categoryImage:
                                            "https://m.media-amazon.com/images/I/61SUj2aKoEL._AC_SL1500_.jpg",
                                          categoryName: "Gift", categoriesImageView: UIColor.lightRedColor),
                          
                          CategoriesModel(categoryImage:
                                            "https://m.media-amazon.com/images/I/61SUj2aKoEL._AC_SL1500_.jpg",
                                          categoryName: "Fashion", categoriesImageView: UIColor.lightYellowColor),
                          CategoriesModel(categoryImage:
                                            "https://m.media-amazon.com/images/I/61SUj2aKoEL._AC_SL1500_.jpg",
                                          categoryName: "Gadget",  categoriesImageView: UIColor.lightPurpleColor),
                          CategoriesModel(categoryImage:
                                            "https://m.media-amazon.com/images/I/61SUj2aKoEL._AC_SL1500_.jpg",
                                          categoryName: "Computer",  categoriesImageView: UIColor.lightGreenColor),
                          CategoriesModel(categoryImage:
                                            "https://m.media-amazon.com/images/I/61SUj2aKoEL._AC_SL1500_.jpg",
                                          categoryName: "Souvenir",  categoriesImageView: UIColor.lightRedColor)
                          
            ]
    }
}
