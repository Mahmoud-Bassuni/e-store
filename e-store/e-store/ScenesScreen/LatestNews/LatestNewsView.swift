//
//  LatestNewsView.swift
//  e-store
//
//  Created by Zeyad on 03/05/2023.
//

import UIKit

class LatestNewsView: UIView {
    
    @IBOutlet weak var latestNewsTableView: UITableView!
    
    var dataSource:[LatestNewsModel] = []
    var viewModel: LatestNewsViewModel
    
    init(viewModel: LatestNewsViewModel) {
        self.viewModel = viewModel
        super.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        self.viewModel = LatestNewsViewModel()
        super.init(frame: frame)
        commonInit()
        setUpTableView()
        dataSource = viewModel.setUpDataSourceList()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = LatestNewsViewModel()
        super.init(coder: aDecoder)
        commonInit()
        setUpTableView()
        dataSource = viewModel.setUpDataSourceList()
    }
    
    func commonInit() {
        fromNib(type: LatestNewsView.self)
    }
    
    func setUpTableView() {
        latestNewsTableView.delegate = self
        latestNewsTableView.dataSource = self
        latestNewsTableView.register(
            UINib(nibName: "LatestNewsTableViewCell", bundle: nil),
            forCellReuseIdentifier: "LatestNewsTableViewCell")
    }

}

extension LatestNewsView: UITableViewDelegate{
    
}

extension LatestNewsView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LatestNewsTableViewCell", for: indexPath)
                as? LatestNewsTableViewCell else { return UITableViewCell() }
        
        cell.bindCell(latestNewsModel: dataSource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellHeight = tableView.frame.height / CGFloat(3)
        return cellHeight
    }
    
}


