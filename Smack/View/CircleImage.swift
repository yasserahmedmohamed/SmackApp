//
//  CircleImage.swift
//  Smack
//
//  Created by yasser ahmed on 4/17/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

class CircleImage: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
     setupview()
    }
    
    func setupview(){
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupview()
    }
}
