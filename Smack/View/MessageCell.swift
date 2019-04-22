//
//  MessageCell.swift
//  Smack
//
//  Created by yasser ahmed on 4/21/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    // outlets
    @IBOutlet weak var timestamplbl: UILabel!
    
    @IBOutlet weak var messagelbl: UILabel!
    @IBOutlet weak var usernamelbl: UILabel!
    @IBOutlet weak var userImg: CircleImage!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setlayouts(message : Message)
    {
        messagelbl.text = message.message
        usernamelbl.text = message.username
        userImg.image = UIImage.init(named: message.userAvatar)
        userImg.backgroundColor = UserDataService.instance.getavatarColor(components: message.useravatarColor)
        
        
        //// convert timestamp value
        
        guard var iosdate = message.timestamp else {return}
        let end = iosdate.index(iosdate.endIndex, offsetBy: -5)
        iosdate = iosdate.substring(to: end)
        
        let isoformatter = ISO8601DateFormatter()
        let chatDate = isoformatter.date(from: iosdate.appending("Z"))
        
        let newformatter = DateFormatter()
        newformatter.dateFormat = "MM d, h:mm a"
        
        
        if let finaldate = chatDate{
            let finaldate = newformatter.string(from: finaldate)
            timestamplbl.text = finaldate
        }
        
    }
}
