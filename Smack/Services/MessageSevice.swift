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
    
    func GetAllChannels(complition :@escaping CompilationHandler){
        
        Alamofire.request(url_channels, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Berrer_header).responseJSON { (responce) in
            if responce.result.error == nil{
                guard let data = responce.data else {return }
               
                do{
                    self.channels = try JSONDecoder().decode([Channel].self, from: data)
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
}
