//
//  ItemViewController.swift
//  e-store
//
//  Created by Zeyad on 11/04/2023.
//

import UIKit

class CategoryItemsViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var itemsCollectionView: UICollectionView!
    
    var itemsViewModel: ItemsViewModel
    var items : [CategoryItem] = []
    
    //MARK: - Init
    init(itemsViewModel: ItemsViewModel) {
        self.itemsViewModel = itemsViewModel
        
         super.init(nibName: nil, bundle: nil)
     }

     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemsCollectionView.layer.cornerRadius = 10
        itemsCollectionView.layer.backgroundColor = Asset.grayColor
        let layout = itemsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
                layout?.sectionInset = UIEdgeInsets(top: 25, left: 25, bottom: 15, right: 25)
        
        itemsCollectionView.dataSource = self
        itemsCollectionView.delegate = self
        
        //getting the data
        self.items = itemsViewModel.getData()
        
        //registering my cells
        let cellNib = UINib(nibName: "ItemsCollectionViewCell", bundle: nil)
        itemsCollectionView.register(cellNib, forCellWithReuseIdentifier: "ItemsCollectionViewCell")
        itemsCollectionView.reloadData()
    }

}

extension CategoryItemsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = itemsCollectionView.dequeueReusableCell(withReuseIdentifier: "ItemsCollectionViewCell", for: indexPath) as! ItemsCollectionViewCell
        cell.layer.cornerRadius = 10
        let item = items[indexPath.row]
        cell.setupOutlets(product: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 156, height: 242)
    }
    
}
