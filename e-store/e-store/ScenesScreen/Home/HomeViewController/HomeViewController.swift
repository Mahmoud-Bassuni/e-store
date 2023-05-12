//
//  HomeViewController.swift
//  e-store
//
//  Created by Ahmed Atef on 26/04/2023.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItems()
        // Do any additional setup after loading the view.
    }

    private func setupNavigationItems() {
        navigationItem.title = "Mega Mall"
        let bell = UIBarButtonItem(image: UIImage(systemName: "bell"),
                                    style: .plain,
                                    target: self,
                                    action: #selector(bellTapped))
        bell.tintColor = UIColor.black
        let cart = UIBarButtonItem(image: UIImage(systemName: "cart"),
                                   style: .plain,
                                   target: self,
                                   action: #selector(cartTapped))
        [bell, cart].forEach {
            $0.tintColor = UIColor.navyBlackColor
        }
        navigationItem.rightBarButtonItems = [cart, bell]
    }
    
    @objc private func bellTapped() {
        // TODO:- Implement me
    }
    @objc private func cartTapped() {
        // TODO:- Implement me
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
