//
//  AddAccountVC.swift
//  Smack
//
//  Created by yasser ahmed on 4/11/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

class AddAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func CancelAddAccountTapped(_ sender: Any) {
       performSegue(withIdentifier: uniwind, sender: nil)
    }
    
}
