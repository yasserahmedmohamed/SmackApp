//
//  ProductCell.swift
//  Sample_Shopping_app
//
//  Created by yasser ahmed on 4/10/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var productname:UILabel!
    @IBOutlet weak var productimage:UIImageView!
    @IBOutlet weak var productprice:UILabel!
    
    
    func setproductitemValue(Forproduct product:Product){
        productimage.image=UIImage(named: product.getimage())
        productname.text=product.getname()
        productprice.text=product.getprice()
    }
    
    
}
