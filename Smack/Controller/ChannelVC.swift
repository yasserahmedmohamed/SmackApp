//
//  ChannelVC.swift
//  Smack
//
//  Created by yasser ahmed on 4/10/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController ,UITableViewDelegate , UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return  MessageService.instance.channels.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "channellCell") as? ChannelCell{
            cell.setcellView(channel:MessageService.instance.channels[indexPath.row] )
            return cell
        }
        else
        {
            return UITableViewCell()
        }
    }
    

    @IBOutlet weak var ChannelltableView: UITableView!
    @IBOutlet weak var loginbutton: UIButton!
    
    @IBOutlet weak var userimage: CircleImage!
    @IBAction func prepareforwind(segue : UIStoryboardSegue)
    {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      
ChannelltableView.dataSource = self
        ChannelltableView.delegate = self
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
        NotificationCenter.default.addObserver(self, selector: #selector( ChannelVC.userdatadidchanged(_notif:)), name: notify_user_data_did_changed, object: nil)
        
        SoketService.instance.getChannel { (success) in
            if success{
                self.ChannelltableView.reloadData()
            }
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        setupuserINFO()
    }

    
    @IBAction func LoginButtonTapped(_ sender: Any) {
        if AuthService.instance.isloggedin {
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile , animated : true ,completion: nil)
        }
        else{
        performSegue(withIdentifier: to_login, sender: nil)
        }
    }
  @objc  func userdatadidchanged(_notif : Notification)
    {
      // let stat =  _notif.object as? String
        setupuserINFO()
    }
    
    func setupuserINFO(){
        if AuthService.instance.isloggedin {
            loginbutton.setTitle(UserDataService.instance.name, for: .normal)
            userimage.image = UIImage.init(named: UserDataService.instance.avatarName)
            userimage.backgroundColor = UserDataService.instance.getavatarColor(components: UserDataService.instance.avatarColor)
        }
        else{
            loginbutton.setTitle("Login", for: .normal)
            userimage.image = UIImage.init(named: "menuProfileIcon")
            userimage.backgroundColor = UIColor.clear
        }
    }
    
    @IBAction func AddChannelTapped(_ sender: Any) {
        let addchannel = AddChannelVC()
        addchannel.modalPresentationStyle = .custom
        present(addchannel,animated: true)
    }
    
}
