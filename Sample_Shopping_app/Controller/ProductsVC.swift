//
//  ProductsVC.swift
//  Sample_Shopping_app
//
//  Created by yasser ahmed on 4/10/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

class ProductsVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    private(set) var Products = [Product]()
    @IBOutlet weak var ProductCollectionVeiw: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ProductCollectionVeiw.dataSource=self
        ProductCollectionVeiw.delegate=self
        // Do any additional setup after loading the view.
    }
    
    
    func getProducts(category:Category)
    {
        Products=DataService.inestance.getProducts(selectedCategory: category)
        self.title=category.categoryname
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     return Products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productcellidenty", for:  indexPath) as? ProductCell
        {
            cell.setproductitemValue(Forproduct: Products[indexPath.row])
            return cell
        }
        return ProductCell()
    }
    

}
