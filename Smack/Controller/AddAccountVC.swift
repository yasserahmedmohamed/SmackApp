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
    
    @IBOutlet weak var loadingActivityIndcator: UIActivityIndicatorView!
    @IBOutlet weak var LoadingView: UIView!
    //variables
    var avatarname = "profileDefault"
    var avatarcolor = "[0.5,0.5,0.5,1]"
    var bgcolor : UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
setupview()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != ""{
            UserImg.image = UIImage(named: UserDataService.instance.avatarName)
            avatarname = UserDataService.instance.avatarName
            if avatarname.contains("light") && bgcolor == nil{
                UserImg.backgroundColor = UIColor.lightGray
            }
        }
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
        guard let name = UserNameTxt.text ,Emailtxt.text != "" else
        {
            return
        }
        UIView.animate(withDuration: 0.2) {
           self.loadingActivityIndcator.isHidden = false
            self.LoadingView.isHidden = false
            self.loadingActivityIndcator.startAnimating()
        }
       
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if (success)
            {
                AuthService.instance.LoginUSer(foremail: email, forpassowrd: password, copmlition: { (success) in
                    if(success)
                    {
                        AuthService.instance.createUSer(name: name, email: email, avatarname: self.avatarname, avatarcolor: self.avatarcolor, completion: { (success) in
                            if(success)
                            {
                                self.loadingActivityIndcator.stopAnimating()
                                
                                self.loadingActivityIndcator.isHidden = true
                                self.LoadingView.isHidden = true
                                print(UserDataService.instance.name,UserDataService.instance.email)
                                self.performSegue(withIdentifier: uniwind, sender: nil)
                                NotificationCenter.default.post(name: notify_user_data_did_changed,object: nil)
                            }
                        })
                    }
                })
            }
            else{
                print("some error happend")
                self.loadingActivityIndcator.stopAnimating()

               self.loadingActivityIndcator.isHidden = true
                self.LoadingView.isHidden = true
                
            }
        }
    }
   
    @IBAction func ChooseAvatarTapped(_ sender: Any) {
        performSegue(withIdentifier: to_avatar_piker, sender: nil)
    }
    
    @IBAction func GenerateBackgroundtapped(_ sender: Any) {
        let r = CGFloat( arc4random_uniform(255)) / 255
        let g = CGFloat( arc4random_uniform(255)) / 255
        let b = CGFloat( arc4random_uniform(255)) / 255

        bgcolor = UIColor(red: r, green: g, blue: b, alpha: 1)
        UIView.animate(withDuration: 0.2)
        {
            self.UserImg.backgroundColor = self.bgcolor

        }
        
    }
    
    func setupview(){
        UserNameTxt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor : smackpurbleColor ])
        Passwordtxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor : smackpurbleColor ])
        Emailtxt.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedStringKey.foregroundColor : smackpurbleColor ])
        let tap = UITapGestureRecognizer(target: self, action: #selector         (AddAccountVC.handletap))
        view.addGestureRecognizer(tap)
    }
   @objc func handletap(){
        view.endEditing(true)
    }
}
