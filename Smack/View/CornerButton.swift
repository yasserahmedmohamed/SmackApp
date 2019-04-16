//
//  CornerButton.swift
//  Smack
//
//  Created by yasser ahmed on 4/11/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

@IBDesignable
class CornerButton: UIButton {

    @IBInspectable var corner :CGFloat = 5.0 {
        didSet{
           self.layer.cornerRadius = corner
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       setupView()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    func setupView(){
        layer.cornerRadius = corner
        
    }
}
