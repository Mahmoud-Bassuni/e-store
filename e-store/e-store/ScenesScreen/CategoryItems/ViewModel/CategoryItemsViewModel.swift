//
//  ItemsViewModel.swift
//  e-store
//
//  Created by Zeyad on 11/04/2023.
//

import Foundation

class ItemsViewModel {
    func getData() -> [CategoryItem] { 
        var items :[CategoryItem] = []
        var item = CategoryItem(img: "https://m.media-amazon.com/images/I/61SUj2aKoEL._AC_SL1500_.jpg", name: "airPods1", price: 1000, rating: 2.5, reviews: 200)
        items.append(item)
        var item2 = CategoryItem(img: "https://m.media-amazon.com/images/I/61SUj2aKoEL._AC_SL1500_.jpg", name: "airPods2", price: 2000, rating: 3.5, reviews: 250)
        items.append(item2)
        var item3 = CategoryItem(img: "https://m.media-amazon.com/images/I/61SUj2aKoEL._AC_SL1500_.jpg", name: "airPods3", price: 3000, rating: 4.0, reviews: 350)
        items.append(item3)
        var item4 = CategoryItem(img: "https://m.media-amazon.com/images/I/61SUj2aKoEL._AC_SL1500_.jpg", name: "airPods4", price: 4000, rating: 4.5, reviews: 400)
        items.append(item4)
        var item5 = CategoryItem(img: "https://m.media-amazon.com/images/I/61SUj2aKoEL._AC_SL1500_.jpg", name: "airPods5", price: 5000, rating: 5.0, reviews: 550)
        items.append(item5)
        
        return items
    }
}
