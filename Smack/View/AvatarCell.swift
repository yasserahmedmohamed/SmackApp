//
//  AvatarCell.swift
//  Smack
//
//  Created by yasser ahmed on 4/17/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

enum AvatarType{
    case dark
    case light
}
class AvatarCell: UICollectionViewCell {
    @IBOutlet weak var AvatarIm: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupview()
    }
    func configureCell(index : Int , type : AvatarType)
    {
        if  type == AvatarType.dark {
            AvatarIm.image = UIImage (named: "dark\(index)")
            self.layer.backgroundColor = UIColor.lightGray.cgColor
        }
        else{
            AvatarIm.image = UIImage (named: "light\(index)")
            self.layer.backgroundColor = UIColor.gray.cgColor
        }
    }
    
    func setupview()
    {
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
}
