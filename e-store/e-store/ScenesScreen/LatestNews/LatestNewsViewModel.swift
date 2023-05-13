//
//  LatestNewsViewModel.swift
//  e-store
//
//  Created by Zeyad on 07/05/2023.
//

import Foundation
import UIKit

class LatestNewsViewModel {
    func setUpDataSourceList() -> [LatestNewsModel] {
        return [LatestNewsModel(newsImageURL: "https://m.media-amazon.com/images/I/61SUj2aKoEL._AC_SL1500_.jpg",
                                      newsTitle: "Philosophy That Addresses Topics Such As Goodness",
                                      newsDesc: "Agar tetap kinclong, bodi motor ten...", newsDate: "13 Jan 2021"),
                LatestNewsModel(newsImageURL: "https://m.media-amazon.com/images/I/61SUj2aKoEL._AC_SL1500_.jpg",
                                      newsTitle: "Philosophy That Addresses Topics Such As Goodness",
                                      newsDesc: "Agar tetap kinclong, bodi motor ten...", newsDate: "13 Jan 2021"),
                      LatestNewsModel(newsImageURL: "https://m.media-amazon.com/images/I/61SUj2aKoEL._AC_SL1500_.jpg",
                                      newsTitle: "Philosophy That Addresses Topics Such As Goodness",
                                      newsDesc: "Agar tetap kinclong, bodi motor ten...", newsDate: "13 Jan 2021") ]
    }
}
