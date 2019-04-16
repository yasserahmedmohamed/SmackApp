//
//  AddAccountVC.swift
//  Smack
//
//  Created by yasser ahmed on 4/11/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

class AddAccountVC: UIViewController {

    @IBOutlet weak var UserNameTxt: UITextField!
    
    @IBOutlet weak var Passwordtxt: UITextField!
    @IBOutlet weak var Emailtxt: UITextField!
    @IBOutlet weak var UserImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func CancelAddAccountTapped(_ sender: Any) {
       performSegue(withIdentifier: uniwind, sender: nil)
    }
    
    @IBAction func CreateAccountTapped(_ sender: Any) {
       guard let password = Passwordtxt.text ,Passwordtxt.text != "" else
        {
            return
        }
        guard let email = Emailtxt.text ,Emailtxt.text != "" else
        {
            return
        }
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if (success)
            {
                AuthService.instance.LoginUSer(foremail: email, forpassowrd: password, copmlition: { (success) in
                    if(success)
                    {
                        print("logged in ", AuthService.instance.authtoken )
                    }
                })
            }
            else{
                print("some error happend")
            }
        }
    }
   
    @IBAction func ChooseAvatarTapped(_ sender: Any) {
    }
    
    @IBAction func GenerateBackgroundtapped(_ sender: Any) {
    }
}
