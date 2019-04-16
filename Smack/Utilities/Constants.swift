//
//  Constants.swift
//  Smack
//
//  Created by yasser ahmed on 4/11/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import Foundation

typealias CompilationHandler = (_ Succsess : Bool)->()

//segue values

var to_login:String = "tologin"
var create_account:String = "showcreateaccount"
var uniwind:String = "uniwind"



// user defualts

let LOGGED_IN_KEY = "loggedin"
let TOKEN_KEY = "token"
let USER_MAIL = "userem"

// urls Constants

let base_url = "http://localhost:3005/v1"
let url_register = "\(base_url)/account/register"
let url_login = "\(base_url)/account/login"
let url_user_add = "\(base_url)/user/add"
// headers
let HEADER = [
    "Content-Type" : "application/json; charset=utf-8"
]
