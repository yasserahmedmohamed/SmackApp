//
//  Message.swift
//  Smack
//
//  Created by yasser ahmed on 4/21/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import Foundation

struct Message {
    public private(set) var message : String!
    public private(set) var username : String!
    public private(set) var channelid : String!
    public private(set) var userAvatar : String!
    public private(set) var useravatarColor : String!
    public private(set) var id : String!
    public private(set) var timestamp : String!

    init(message : String , username : String ,channelid : String,userAvatar : String,useravatarColor : String,id : String,timestamp : String ) {
        self.message = message
        self.username = username
        self.channelid = channelid
        self.userAvatar = userAvatar
        self.useravatarColor = useravatarColor
        self.id = id
        self.timestamp = timestamp

    }
}
