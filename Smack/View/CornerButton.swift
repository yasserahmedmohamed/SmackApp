//
//  CornerButton.swift
//  Smack
//
//  Created by yasser ahmed on 4/11/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

class CornerButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
    }

}
