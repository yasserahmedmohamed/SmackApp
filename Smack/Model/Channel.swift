//
//  Channel.swift
//  Smack
//
//  Created by yasser ahmed on 4/18/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import Foundation
struct Channel : Decodable{
    public private(set) var name : String
    public private(set) var description : String
    public private(set) var _id : String
    public private(set) var __v : Int
    

    init(channelTitle : String , channelDescription : String ,channel_id : String ) {
        self._id = channel_id
        self.description = channelDescription
        self.name = channelTitle
        self.__v = 0
    }
}
