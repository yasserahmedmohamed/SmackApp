//
//  Gradientview.swift
//  Smack
//
//  Created by yasser ahmed on 4/10/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit
@IBDesignable
class Gradientview: UIView {

    @IBInspectable var topcolor:UIColor=#colorLiteral(red: 0.2901960784, green: 0.3019607843, blue: 0.8470588235, alpha: 1)
        {
        didSet{
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var bottomcolor:UIColor=#colorLiteral(red: 0.1725490196, green: 0.831372549, blue: 0.8470588235, alpha: 1)
        {
        didSet{
            self.setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        let gradientlayer = CAGradientLayer()
        
        gradientlayer.colors=[topcolor.cgColor,bottomcolor.cgColor]
        gradientlayer.startPoint = CGPoint(x: 0, y: 0)
        gradientlayer.endPoint = CGPoint(x: 1, y: 1)
        gradientlayer.frame = self.bounds
        self.layer.insertSublayer(gradientlayer, at: 0)
    }
}
