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
    func setavatarColor(forAvColor color : String)  {
        self.avatarColor = color
    }
    
    func getavatarColor(components : String ) -> UIColor {
        let scanner = Scanner(string: components)
        let skiped  = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skiped
        var r , g , b , a : NSString?
        
        scanner.scanUpToCharacters(from: comma, into: &r)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &a)

        let defultcol = UIColor.lightGray
        guard let Rwrapd = r else {
            return defultcol
        }
        guard let Gwrapd = g else {
            return defultcol
        }
        guard let Bwrapd = b else {
            return defultcol
        }
        guard let Awrapd = a else {
            return defultcol
        }
        let rfloat = CGFloat(Rwrapd.doubleValue)
        let gfloat = CGFloat(Gwrapd.doubleValue)
        let bfloat = CGFloat(Bwrapd.doubleValue)
        let afloat = CGFloat(Awrapd.doubleValue)

        return UIColor(red: rfloat, green: gfloat, blue: bfloat, alpha: afloat)
    }
    
    func Logout(){
        id = ""
        avatarName = ""
        avatarColor = ""
        name = ""
        email = ""
        AuthService.instance.isloggedin = false
        AuthService.instance.userEmail = ""
        AuthService.instance.authtoken = ""
        MessageService.instance.ClearChannels()
        MessageService.instance.clearMessages()
    }
}
