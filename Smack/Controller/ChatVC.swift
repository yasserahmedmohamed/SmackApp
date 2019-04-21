//
//  ChatVC.swift
//  Smack
//
//  Created by yasser ahmed on 4/10/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    @IBOutlet weak var MenuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MenuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController()
            .tapGestureRecognizer())
        if AuthService.instance.isloggedin {
            AuthService.instance.finduserByEmail { (success) in
                if success{
                     NotificationCenter.default.post(name: notify_user_data_did_changed, object:nil)
                   }
            }
           
        }
        MessageService.instance.GetAllChannels(complition: { (success) in
        })
    }
    

   

}
