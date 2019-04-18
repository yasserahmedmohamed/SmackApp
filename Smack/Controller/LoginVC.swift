//
//  LoginVC.swift
//  Smack
//
//  Created by yasser ahmed on 4/11/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var ActivIndLoading: UIActivityIndicatorView!
    @IBOutlet weak var ActiIndcatorView: UIView!
    @IBOutlet weak var Usernametxt: UITextField!
    
    @IBOutlet weak var Passwordtxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupview()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func CloseButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func DontHaveAccountTapped(_ sender: Any) {
        performSegue(withIdentifier: create_account, sender: nil)
    }
    
    @IBAction func LoginTapped(_ sender: Any) {
        ActivIndLoading.isHidden = false
        ActiIndcatorView.isHidden = false
        ActivIndLoading.startAnimating()
        guard let password = Passwordtxt.text ,Passwordtxt.text != "" else
        {
            return
        }
        guard let email = Usernametxt.text ,Usernametxt.text != "" else
        {
            return
        }
        
        AuthService.instance.LoginUSer(foremail: email, forpassowrd: password) { (success) in
            if success {
                AuthService.instance.finduserByEmail(Complition: { (success) in
                    NotificationCenter.default.post(name: notify_user_data_did_changed, object: nil)
                    self.ActivIndLoading.stopAnimating()
                    self.dismiss(animated: true, completion: nil)
                })
            }
            else
            {
                
            }
        }
    }
    func setupview(){
        Usernametxt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor : smackpurbleColor ])
        Passwordtxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor : smackpurbleColor ])
               let tap = UITapGestureRecognizer(target: self, action: #selector         (LoginVC.handletap))
        view.addGestureRecognizer(tap)
        
    }
    @objc func handletap(){
        view.endEditing(true)
    }
}
