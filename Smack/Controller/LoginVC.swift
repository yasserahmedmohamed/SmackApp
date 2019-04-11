//
//  LoginVC.swift
//  Smack
//
//  Created by yasser ahmed on 4/11/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var Usernametxt: UITextField!
    
    @IBOutlet weak var Passwordtxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func CloseButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func DontHaveAccountTapped(_ sender: Any) {
    }
    
}
