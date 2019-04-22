//
//  ChatVC.swift
//  Smack
//
//  Created by yasser ahmed on 4/10/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

class ChatVC: UIViewController , UITableViewDelegate , UITableViewDataSource {
    

    @IBOutlet weak var MenuButton: UIButton!
    @IBOutlet weak var ChannelNameLbl: UILabel!
    @IBOutlet weak var chatTableView: UITableView!
    
    @IBOutlet weak var MessageTxtBox: UITextField!
    
    @IBOutlet weak var SendButton: UIButton!
    @IBOutlet weak var TypingLbl: UILabel!
    /// variables
    var istyping : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.bindToKeyboard()
        let tap = UITapGestureRecognizer(target: self, action: #selector(ChatVC.handletap))
        view.addGestureRecognizer(tap)
        MenuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController()
            .tapGestureRecognizer())
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.userdatadidchanged(_notif:)), name: notify_user_data_did_changed, object: nil)
        
        SoketService.instance.gettypingUsers { (typingUsers) in
            guard let channelid = MessageService.instance.selectedChannel?._id else {return}
            var name = ""
            var numOfTyping = 0
            for(typinguser , channel ) in typingUsers{
                if typinguser != UserDataService.instance.name && channel == channelid
                {
                    if name == ""{
                        name = typinguser
                    }
                    else {
                        name = "\(name) , \(typinguser)"
                    }
                    numOfTyping += 1
                }
            }
            if numOfTyping > 0 && AuthService.instance.isloggedin {
                var verb = "is"
                if numOfTyping > 1
                {
                    
                    verb = "are"
                }
                self.TypingLbl.text = "\(name) \(verb) typing "
            }
            else {
                self.TypingLbl.text = " "
            }
        }
        SoketService.instance.getchatMessage { (message) in
            if message.channelid == MessageService.instance.selectedChannel?._id
            {
                MessageService.instance.messages.append(message)
                self.chatTableView.reloadData()
                 self.scrolltobottom()
            }
             
        }
//        SoketService.instance.getchatMessage { (success) in
//            if success{
//                self.chatTableView.reloadData()
//                if MessageService.instance.messages.count > 0{
//                    self.scrolltobottom()
//                }
//            }
//        }
        
        
        if AuthService.instance.isloggedin {
            AuthService.instance.finduserByEmail { (success) in
                if success{
                     NotificationCenter.default.post(name: notify_user_data_did_changed, object:nil)
                   }
            }
           
        }
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.channelSelectd(notif:)), name: notify_channels_selected, object: nil)
       chatTableView.delegate = self
        chatTableView.dataSource = self
        SendButton.isHidden = true
        chatTableView.estimatedRowHeight = 200
        chatTableView.rowHeight = UITableViewAutomaticDimension
    }
    
    @objc func handletap()
    {
        view.endEditing(true)
    }
    
    @objc func channelSelectd(notif : Notification)
    {
        updatewithchannel()
    }
    
    func updatewithchannel(){
        let channelname = MessageService.instance.selectedChannel?.name ?? ""
        ChannelNameLbl.text = "#\(channelname)"
        getMessages()
        
    }
    
    @objc  func userdatadidchanged(_notif : Notification)
    {
        if  AuthService.instance.isloggedin {
            // get channels
            onLoginGetMessages()
        }
        else
        {
            ChannelNameLbl.text = "Please Log In"
            self.chatTableView.reloadData()
        }
    }

    func onLoginGetMessages(){
        MessageService.instance.GetAllChannels { (success) in
            if success{
                if MessageService.instance.channels.count > 0{
                    MessageService.instance.selectedChannel = MessageService.instance.channels[0]
                    self.updatewithchannel()
                }
                else
                {
                    self.ChannelNameLbl.text = "No channels yet!"
                }
            }
        }
    }
    func getMessages(){
        guard let channelid = MessageService.instance.selectedChannel?._id else {return}
        MessageService.instance.getallMessagesForChannel(channelId: channelid) { (success) in
            if success{
                self.chatTableView.reloadData()
                 self.scrolltobottom()
            }
        }
    }
    
    @IBAction func sendMessageTapped(_ sender: Any) {
        if AuthService.instance.isloggedin {
            guard let channelid = MessageService.instance.selectedChannel?._id else {return}
            guard let message = MessageTxtBox.text else {return}
            SoketService.instance.addMessage(messageBody: message, userId: UserDataService.instance.id, channelId: channelid) { (success) in
                if success{
                    self.MessageTxtBox.text = ""
                    self.MessageTxtBox.resignFirstResponder()
                    self.getMessages()
                   
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageService.instance.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "messagecell") as? MessageCell{
            cell.setlayouts(message: MessageService.instance.messages[indexPath.item])
            return cell
        }
        else{
        return UITableViewCell()
        }
    }
    
    @IBAction func MessageBoxChanged(_ sender: Any) {
        let username = UserDataService.instance.name
        guard let channelid = MessageService.instance.selectedChannel?._id else{return}
        if MessageTxtBox.text == "" {
            istyping = false
            SendButton.isHidden = true
            SoketService.instance.socet.emit("stopType",username, channelid)
        }
        else
        {
            if istyping == false{
                SendButton.isHidden = false
                SoketService.instance.socet.emit("startType",username, channelid)

            }
            istyping = true
        }
    }
    func scrolltobottom(){
        let indexPath = IndexPath(row: MessageService.instance.messages.count - 1, section: 0)
        chatTableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
    }
}
