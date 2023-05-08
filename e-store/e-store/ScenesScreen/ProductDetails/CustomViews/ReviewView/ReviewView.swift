//
//  ReviewView.swift
//  e-store
//
//  Created by Hassan on 19/04/2023.
//

import UIKit
import RxSwift
import RxCocoa

class ReviewView: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet weak var reviewTableView: UITableView!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var seeAllReviewButton: UIButton!
    
    // MARK: - Properties
    
    var viewModel: ReviewViewModel
    
    // MARK: - Life cycle
    
    init(frame: CGRect, viewModel: ReviewViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        
    }
    
    override init(frame: CGRect) {
        self.viewModel = ReviewViewModel()
        super.init(frame: frame)
        commonInit()
        updateUI()
        setupTableView()
        bindTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = ReviewViewModel()
        super.init(coder: aDecoder)
        commonInit()
        updateUI()
        setupTableView()
        bindTableView()
    }
    
    func commonInit() {
        fromNib(type: ReviewView.self)
    }
    func updateUI() {
        seeAllReviewButton.selectStyle(style: .whiteButton)
    }
    func setupTableView() {
        reviewTableView.register(
            UINib(nibName: "ReviewTableViewCell", bundle: nil),
            forCellReuseIdentifier: "ReviewTableViewCell")
    }
}

// MARK: - ReviewViewTableViewDelegate
extension ReviewView : UITableViewDelegate {
    
}

// MARK: - Bind View Model
extension ReviewView {
    
    private func bindTableView(){
        viewModel.dataSource.bind(to: reviewTableView.rx.items(cellIdentifier: "ReviewTableViewCell", cellType: ReviewTableViewCell.self)) { indexPath, data, cell in
            cell.setupCell(comment: data)
        }.disposed(by: viewModel.disposeBag)
    }
}
