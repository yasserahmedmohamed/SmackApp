//
//  AuthService.swift
//  Smack
//
//  Created by yasser ahmed on 4/15/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import Foundation
import Alamofire
class AuthService {
    
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard // like shared prefrance in android
    
    var isloggedin : Bool{
        get{
            return defaults.bool(forKey: LOGGED_IN_KEY )
        }
        set{
            defaults.set(newValue, forKey: LOGGED_IN_KEY )
        }
        
    }
    
    var authtoken : String {
        get{
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set{
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail : String {
        get{
            return defaults.value(forKey: USER_MAIL) as! String
        }
        set{
            defaults.set(newValue, forKey: USER_MAIL)
        }
    }
    
    
    func registerUser(email:String,password:String, copmlition: @escaping CompilationHandler)
    {
        let loweremail = email.lowercased()
        let header = [
            "Content-Type" : "application/json; charset=utf-8"
        ]
        let body : [String : Any ]=[
        
            "email" : loweremail,
            "password" : password
        ]
        Alamofire.request(url_register, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { (responce) in
            
            if responce.error == nil {
                copmlition(true)
            }
            copmlition(false)
            debugPrint(responce.result.error as Any)
        }
    }
}
