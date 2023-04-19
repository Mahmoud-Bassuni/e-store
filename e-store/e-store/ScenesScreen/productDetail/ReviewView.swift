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
        Bundle.main.loadNibNamed("ReviewView", owner: self, options: nil)
        contentView.fixInView(self)
    }
    func updateUI() {
        seeAllReviewButton.selectStyle(style: .whiteButton)
    }
    func setupTableView() {
        reviewTableView.delegate = self
        reviewTableView.dataSource = self
        reviewTableView.register(UINib(nibName: "ReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "ReviewCell")
    }
}

// MARK: - ReviewViewTableViewDelegate
extension ReviewView : UITableViewDelegate {
    
}

// MARK: - ReviewViewTableDataSource
extension ReviewView : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as? ReviewTableViewCell else { return UITableViewCell() }
//        tableView.rowHeight = 140
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as? ReviewTableViewCell else { return 50 }
        let height = cell.calculateHeight()
        return height
    }
}

extension UIView {
    func fixInView(_ container: UIView!) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.frame = container.frame
        container.addSubview(self)
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container,
                           attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container,
                           attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container,
                           attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container,
                           attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        
    }
}
