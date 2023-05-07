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
        return [LatestNewsModel(newsImage: UIImage(named: "avatar") ?? UIImage(),
                                      newsTitle: "Philosophy That Addresses Topics Such As Goodness",
                                      newsDesc: "Agar tetap kinclong, bodi motor ten...", newsDate: "13 Jan 2021"),
                      LatestNewsModel(newsImage: UIImage(named: "avatar") ?? UIImage(),
                                      newsTitle: "Philosophy That Addresses Topics Such As Goodness",
                                      newsDesc: "Agar tetap kinclong, bodi motor ten...", newsDate: "13 Jan 2021"),
                      LatestNewsModel(newsImage: UIImage(named: "avatar") ?? UIImage(),
                                      newsTitle: "Philosophy That Addresses Topics Such As Goodness",
                                      newsDesc: "Agar tetap kinclong, bodi motor ten...", newsDate: "13 Jan 2021") ]
    }
}
