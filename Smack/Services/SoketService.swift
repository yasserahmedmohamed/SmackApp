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
    func addMessage(messageBody : String , userId : String , channelId : String, complition : @escaping CompilationHandler)
    {
        let user = UserDataService.instance
        socet.emit("newMessage", messageBody,userId ,channelId ,user.name, user.avatarName ,user.avatarColor)
        complition(true)
    }
    
    func getchatMessage(complition : @escaping (_ message : Message)-> Void)
    {
        socet.on("messageCreated") { (dataArray, ack) in
            guard let msgbody = dataArray[0] as? String else {return}
            guard let channelID = dataArray[2] as? String else {return}
            guard let username = dataArray[3] as? String else {return}
            guard let useravatar = dataArray[4] as? String else {return}
            guard let useravatarColor = dataArray[5] as? String else {return}
            guard let id = dataArray[6] as? String else {return}
            guard let timestamp = dataArray[7] as? String else {return}
            
                let message = Message(message: msgbody, username: username, channelid: channelID, userAvatar: useravatar, useravatarColor: useravatarColor, id: id, timestamp: timestamp)
               // MessageService.instance.messages.append(message)
                complition(message)
            
           

        }
    }
    
    func gettypingUsers(_ Complition : @escaping(_ typingUsers : [String : String])->Void){
        socet.on("userTypingUpdate") { (dataArray, ack) in
            guard let typingUsers = dataArray[0] as? [String : String] else {return}
            Complition(typingUsers)
        }
    }
    
}
