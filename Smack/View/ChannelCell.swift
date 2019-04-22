//
//  ChannelCell.swift
//  Smack
//
//  Created by yasser ahmed on 4/18/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {

    @IBOutlet weak var Channelname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected{
            self.layer.backgroundColor = UIColor(white: 2, alpha: 0.5).cgColor
            Channelname.font = UIFont(name: "HelveticaNeue-Regular", size: 17)

        }
        else{
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    //"5cb886c709a8c301e60e2224"

    func setcellView(channel : Channel )
    {
        
        Channelname.text = "#\(channel.name)"
        Channelname.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
        for id in MessageService.instance.UnreadMessages {
           if channel._id == id
           {
            Channelname.font = UIFont(name: "HelveticaNeue-Bold", size: 22)

            }
        }
    }
}
