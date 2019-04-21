//
//  AddChannelVC.swift
//  Smack
//
//  Created by yasser ahmed on 4/21/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    // outlets
    @IBOutlet weak var nametxt: UITextField!
    
    @IBOutlet weak var descriptiontxt: UITextField!
    
    @IBOutlet weak var BGView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
     setupView()
        // Do any additional setup after loading the view.
    }


    @IBAction func CloseTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func CreateChannelTapped(_ sender: Any) {
        guard let chanName = nametxt.text , nametxt.text != "" else {
            return
        }
        guard let chanDesc = descriptiontxt.text , descriptiontxt.text != "" else {
            return
        }
        SoketService.instance.addchannel(channelName: chanName, channelDescrption: chanDesc) { (sucsess) in
            self.dismiss(animated: true, completion: nil)
        }
        
    }
 
    func setupView(){
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeSelf(_recog:)))
        BGView.addGestureRecognizer(closeTouch)
        
        nametxt.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedStringKey.foregroundColor : smackpurbleColor])
          descriptiontxt.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedStringKey.foregroundColor : smackpurbleColor])
        
    }
    
    @objc func closeSelf(_recog : UITapGestureRecognizer ){
    
        dismiss(animated: true, completion: nil)
    
    }
}
