//
//  MainTabBarController.swift
//  e-store
//
//  Created by Ahmed Atef on 26/04/2023.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    // MARK: - Properties
    
    static let identifier = String(describing: MainTabBarController.self)
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setControllers()
        setTabBarItemsTitle()
        setTabBarItemsImage()
        setTabBarItemsColor()
    }
    
    // MARK: - Functions
    
    private func setControllers() {
        let controllers = controllersToSet()
        setViewControllers(controllers, animated: true)
    }
    private func controllersToSet() -> [UIViewController] {
        // these controllers just for test
        let productDetails = ProductDetailsViewController()
        let home = HomeViewController()
        return [productDetails, home]
    }
    private func setTabBarItemsTitle() {
        let titles = ["HOME", "WISHLIST", "ORDER", "ACCOUNT"]
        guard let items = tabBar.items else {return}
        for item in 0..<items.count {
            items[item].title = titles[item]
        }
    }
 
    private func setTabBarItemsImage() {
        let images: [UIImage] = [UIImage(named: Asset.home.name) ?? UIImage(),
                                 UIImage(named: Asset.wishlist.name) ?? UIImage(),
                                 UIImage(named: Asset.orders.name) ?? UIImage(),
                                 UIImage(named: Asset.accountPicture.name) ?? UIImage()]
        guard let items = tabBar.items else {return}
        for item in 0..<items.count {
            items[item].image = images[item]
        }
    }
    
    private func setTabBarItemsColor() {
        tabBar.unselectedItemTintColor = UIColor.navyBlackColor
        tabBar.tintColor = UIColor.mediumBlueColor
    }
}
