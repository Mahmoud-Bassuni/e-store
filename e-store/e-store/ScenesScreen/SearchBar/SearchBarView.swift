//
//  SearchBarView.swift
//  e-store
//
//  Created by Zeyad on 29/04/2023.
//

import UIKit

class SearchBarView: UIView {
    
    // MARK: - Outlets
    let searchBar = UISearchBar()

    
    // MARK: - Properties
    
    
    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setupSearchUI()

        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        setupSearchUI()
    }
    
    // MARK: - Functions

    private func commonInit() {
        fromNib(type: SearchBarView.self)
    }
    
    func setupSearchUI(){
        searchBar.delegate = self

        searchBar.placeholder = "Search"
        
        // Set up the search bar
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        addSubview(searchBar)
        
        // Add constraints to position the search bar at the top of the view
        searchBar.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true

    }
    
}

extension SearchBarView: UISearchBarDelegate{
        
    // Implement the UISearchBarDelegate method for handling search text changes
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Handle the search text changes here
    }
    
}





