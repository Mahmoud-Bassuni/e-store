//
//  ReviewView.swift
//  e-store
//
//  Created by Hassan on 19/04/2023.
//

import UIKit

class ReviewView: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet weak var reviewTableView: UITableView!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var seeAllReviewButton: UIButton!
    
    // MARK: - Properties
    
    var text = ["hassan", "ahmed" , "zeyad"]
    
    // MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        updateUI()
        setupTableView()

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        updateUI()
        setupTableView()
    }
    
    func commonInit() {
        fromNib(type: ReviewView.self)
    }
    func updateUI() {
        seeAllReviewButton.selectStyle(style: .whiteButton)
    }
    func setupTableView() {
        reviewTableView.delegate = self
        reviewTableView.dataSource = self
        reviewTableView.register(
            UINib(nibName: "ReviewTableViewCell", bundle: nil),
            forCellReuseIdentifier: "ReviewTableViewCell")
    }
}

// MARK: - ReviewViewTableViewDelegate
extension ReviewView : UITableViewDelegate {
    
}

// MARK: - ReviewViewTableDataSource
extension ReviewView : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        text.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell", for: indexPath)
                as? ReviewTableViewCell else { return UITableViewCell() }
        
        cell.setupCell(comment: text[indexPath.row])
        return cell
    }
   
}
