//
//  ProductDetailsViewController.swift
//  e-store
//
//  Created by Ahmed Atef on 09/04/2023.
//

import UIKit
import Shared_UI

class ProductDetailsViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var featuredProductStackView: UIStackView!
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItems()
        setupFeaturedProductStackView()
    }
    
    // MARK: - Functions
    
    private func setupNavigationItems() {
        navigationItem.title = "Detail Product"
        let arrow = UIBarButtonItem(image: UIImage(named: Asset.arrow.name),
                                    style: .plain,
                                    target: self,
                                    action: #selector(arrowTapped))
        arrow.tintColor = UIColor.black
        let cart = UIBarButtonItem(image: UIImage(systemName: "cart"),
                                   style: .plain,
                                   target: self,
                                   action: #selector(cartTapped))
        [arrow, cart].forEach {
            $0.tintColor = UIColor.navyBlackColor
        }
        navigationItem.rightBarButtonItems = [cart, arrow]
    }
    
    @objc private func arrowTapped() {
        // TODO:- Implement me
    }
    @objc private func cartTapped() {
        // TODO:- Implement me
    }
    
    private func setupFeaturedProductStackView() {
        featuredProductStackView.layer.cornerRadius = 10
        featuredProductStackView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        featuredProductStackView.layer.masksToBounds = true
    }
}
