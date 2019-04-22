//
//  MessageSevice.swift
//  Smack
//
//  Created by yasser ahmed on 4/18/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class MessageService {
    static let instance = MessageService()
    var channels = [Channel]()
    var messages = [Message]()
    var UnreadMessages = [String]()
    var selectedChannel : Channel?
    func GetAllChannels(complition :@escaping CompilationHandler){
        
        Alamofire.request(url_channels, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Berrer_header).responseJSON { (responce) in
            if responce.result.error == nil{
                guard let data = responce.data else {return }
               
                do{
                    self.channels = try JSONDecoder().decode([Channel].self, from: data)
                    NotificationCenter.default.post(name: notify_channels_loaded, object: nil)
                    complition(true)
                }
                catch let error{
                    debugPrint(error as Any)
                }
                print(self.channels)
            }
            else
            {
               debugPrint( responce.result.error as Any )
            }
        }
    }
    
    
    func getallMessagesForChannel(channelId : String,complition :  @escaping CompilationHandler){
        Alamofire.request("\(url_get_messages)/\(channelId)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Berrer_header).responseJSON { (responce) in
            if responce.result.error == nil
            {
                self.clearMessages()
                guard let data = responce.data else {return}
                if let json = JSON(data).array {
                    if(json.count > 0 ){
                    for item in json
                    {
                        let messagebody = item["messageBody"].stringValue
                        let channelid = item["channelId"].stringValue
                        let id = item["_id"].stringValue
                        let username = item["userName"].stringValue
                        let useravatar = item["userAvatar"].stringValue
                        let useravatarColor = item["userAvatarColor"].stringValue
                        let timestamp = item["timeStamp"].stringValue
                        let message = Message(message: messagebody, username: username, channelid: channelid, userAvatar: useravatar, useravatarColor: useravatarColor, id: id, timestamp: timestamp)
                        self.messages.append(message)
                    }
                    print(self.messages)
                        
                        
                    }else{
                       self.messages.removeAll()
                        var temp_message = Message(message: "No Messages", username: "", channelid: channelId, userAvatar: "", useravatarColor: "", id: "", timestamp: "")
                        self.messages.append(temp_message)
                    }
                    complition(true)
                }
                
            }
            else
            {
                debugPrint(responce.result.error as Any)
                complition(false)
            }
        }
    }
    
    func clearMessages()
    {
        messages.removeAll()
    }
    
    func ClearChannels(){
        channels.removeAll()
    }
}
