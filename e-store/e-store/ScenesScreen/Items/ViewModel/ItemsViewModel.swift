//
//  ItemsViewModel.swift
//  e-store
//
//  Created by Zeyad on 11/04/2023.
//

import Foundation

class ItemsViewModel{
    func getData() -> [Item]{
        var items :[Item] = []
        var item = Item(img: ImageAsset(name: "airPods1"), name: "airPods1", price: 1000, rating: 2.5, reviews: 200)
        items.append(item)
        var item2 = Item(img: ImageAsset(name: "airPods2"), name: "airPods2", price: 2000, rating: 3.5, reviews: 250)
        items.append(item2)
        var item3 = Item(img: ImageAsset(name: "airPods3"), name: "airPods3", price: 3000, rating: 4.0, reviews: 350)
        items.append(item3)
        var item4 = Item(img: ImageAsset(name: "airPods4"), name: "airPods4", price: 4000, rating: 4.5, reviews: 400)
        items.append(item4)
        var item5 = Item(img: ImageAsset(name: "airPods5"), name: "airPods5", price: 5000, rating: 5.0, reviews: 550)
        items.append(item5)
        
        return items
    }
}
