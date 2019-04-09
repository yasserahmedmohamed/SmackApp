//
//  CategoryCell.swift
//  Sample_Shopping_app
//
//  Created by yasser ahmed on 4/9/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var CategoryName:UILabel!
    @IBOutlet weak var CategoryImage:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setValues(Forname name:String,forimage image:String){
        CategoryName.text=name
        CategoryImage.image=UIImage.init(imageLiteralResourceName: image)
        
    }

}
