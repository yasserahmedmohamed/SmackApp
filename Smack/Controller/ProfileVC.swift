//
//  ProfileVC.swift
//  Smack
//
//  Created by yasser ahmed on 4/17/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var emailtxt: UILabel!
    @IBOutlet weak var Usernametxt: UILabel!
    @IBOutlet weak var ProfileImg: UIImageView!

    @IBOutlet weak var Bgview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
     setupview()
        // Do any additional setup after loading the view.
    }


    @IBAction func closeModelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
   
    @IBAction func LogoutTapped(_ sender: Any) {
        UserDataService.instance.Logout()
        NotificationCenter.default.post(name: notify_user_data_did_changed, object: nil)
        dismiss(animated: true, completion: nil)

    }
    
    func setupview(){
        
        emailtxt.text = UserDataService.instance.email
        Usernametxt.text = UserDataService.instance.name
        ProfileImg.image = UIImage.init(named: UserDataService.instance.avatarName)
        ProfileImg.backgroundColor = UserDataService.instance.getavatarColor(components: UserDataService.instance.avatarColor)

        let  closeTapped = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.closeTap(_:)))
        
        Bgview.addGestureRecognizer(closeTapped)
        
        
    }
    
    @objc func closeTap(_ regoc : UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }
}
