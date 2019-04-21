//
//  SoketService.swift
//  Smack
//
//  Created by yasser ahmed on 4/21/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit
import SocketIO
class SoketService: NSObject {

    static let instance = SoketService()
    let manager : SocketManager
    let socet : SocketIOClient
    
    override init() {
        self.manager = SocketManager(socketURL: URL(string: base_url)!)
        self.socet = manager.defaultSocket
        super.init()
    }
    func staplishConnection(){
        socet.connect()
    }
    func closeConnection(){
        socet.disconnect()
    }
    
    func addchannel(channelName : String , channelDescrption : String , complition : @escaping(CompilationHandler))
    {
        socet.emit("newChannel", channelName,channelDescrption)
        complition(true)
    }
    
    func getChannel(complition : @escaping(CompilationHandler))
    {
        socet.on("channelCreated") { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String else {return}
            guard let channeldesc = dataArray[1] as? String else {return}
            guard let channelID = dataArray[2] as? String else {return}
            let newChannel = Channel(channelTitle: channelName, channelDescription: channeldesc, channel_id: channelID)
            MessageService.instance.channels.append(newChannel)
            complition(true)
        }
    }
}
