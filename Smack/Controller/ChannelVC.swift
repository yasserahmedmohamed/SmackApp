//
//  ChannelVC.swift
//  Smack
//
//  Created by yasser ahmed on 4/10/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    
    @IBAction func prepareforwind(segue : UIStoryboardSegue)
    {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
    }
    

    
    @IBAction func LoginButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: to_login, sender: nil)
    }
    
    
}
