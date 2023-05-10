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
                                            UIImage(systemName: "carrot")?.withTintColor(.green,renderingMode: .alwaysOriginal) ?? UIImage(), categoryName: "Food", categoriesImageView: UIColor.lightGreenColor),
                          CategoriesModel(categoryImage: UIImage(systemName: "gift")?.withTintColor(.red,renderingMode: .alwaysOriginal) ?? UIImage(),
                                          categoryName: "Gift", categoriesImageView: UIColor.lightRedColor),
                          
                          CategoriesModel(categoryImage:
                                            UIImage(systemName: "tshirt")?.withTintColor(.orange,renderingMode: .alwaysOriginal) ?? UIImage(),
                                          categoryName: "Fashion", categoriesImageView: UIColor.lightYellowColor),
                          CategoriesModel(categoryImage:
                                            UIImage(systemName: "airpodspro")?.withTintColor(.purple,renderingMode: .alwaysOriginal) ?? UIImage(),
                                          categoryName: "Gadget",  categoriesImageView: UIColor.lightPurpleColor),
                          CategoriesModel(categoryImage:
                                            UIImage(systemName: "laptopcomputer")?.withTintColor(.green,renderingMode: .alwaysOriginal) ?? UIImage(),
                                          categoryName: "Computer",  categoriesImageView: UIColor.lightGreenColor),
                          CategoriesModel(categoryImage:
                                            UIImage(systemName: "giftcard")?.withTintColor(.purple,renderingMode: .alwaysOriginal) ?? UIImage(),
                                          categoryName: "Souvenir",  categoriesImageView: UIColor.lightRedColor)
                          
            ]
    }
}
