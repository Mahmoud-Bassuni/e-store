//
//  ReviewViewModel.swift
//  e-store
//
//  Created by Ahmed Atef on 09/05/2023.
//

import Foundation
import RxSwift
import RxCocoa

class ReviewViewModel {
    
    // MARK: - Properties
    let dataSource = BehaviorRelay<[String]>(value: [])
    let disposeBag = DisposeBag()
    
    // MARK: - Properties
    
    init() {
        setupDataSource()
    }
    
    // MARK: - Functions

    private func setupDataSource() {
        var text = ["hassan", "ahmed" , "zeyad"]
        dataSource.accept(text)
    }
}
