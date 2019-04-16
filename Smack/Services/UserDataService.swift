//
//  UserDataService.swift
//  Smack
//
//  Created by yasser ahmed on 4/16/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import Foundation
class UserDataService{
    
    static let instance = UserDataService()
    
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    func setUserData(id:String , color:String,avatar:String,email:String,name:String){
        self.id = id
        self.avatarColor = color
        self.avatarName = avatar
        self.email = email
        self.name = name
        
    }
    
    func setavatarName(foravatarname name:String)
    {
        self.avatarName = name
    }

    
    
}
