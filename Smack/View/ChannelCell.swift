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
        }
        else{
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }

    func setcellView(channel : Channel )
    {
        Channelname.text = "#\(channel.name)"
    }
}
