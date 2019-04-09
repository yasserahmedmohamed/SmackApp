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
        accemoletterAnimation()
    }

    func setValues(Forname name:String,forimage image:String){
        CategoryName.text=name
        CategoryImage.image=UIImage.init(imageLiteralResourceName: image)
        
    }
    
    func accemoletterAnimation(){
            let min=CGFloat(-40)
        let max=CGFloat(40)
        
        let x=UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.x", type: .tiltAlongHorizontalAxis)
        let y=UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.y", type: .tiltAlongVerticalAxis)
        x.minimumRelativeValue=min
        x.maximumRelativeValue=max
        y.minimumRelativeValue=min
        y.maximumRelativeValue=max
        
        let motingroub=UIMotionEffectGroup()
        motingroub.motionEffects=[x,y]
        CategoryImage.addMotionEffect(motingroub)
    }

}
