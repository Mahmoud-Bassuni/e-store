//
//  ProductDetailsViewController.swift
//  e-store
//
//  Created by Ahmed Atef on 09/04/2023.
//

import UIKit
import Shared_UI

class ProductDetailsViewController: UIViewController {
    
    // MARK: - Properties
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItems()
    }
    // MARK: - Functions
    private func setupNavigationItems() {
        navigationItem.title = "Detail Product"
        let arrow = UIBarButtonItem(image: UIImage(systemName: "arrowshape.turn.up.right"), style: .plain, target: self, action: #selector(addTapped))
        arrow.tintColor = UIColor.black
        let cart = UIBarButtonItem(image: UIImage(systemName: "cart.fill"), style: .plain, target: self, action: #selector(addTapped))
        [arrow, cart].forEach {
            $0.tintColor = UIColor.navyBlackColor
        }
        navigationItem.rightBarButtonItems = [cart, arrow]
    }
    
    @objc private func addTapped() {
        //TODO: - Implement me 
    }
    
}
