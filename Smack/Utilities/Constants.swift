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
var to_avatar_piker = "toavatarpiker"


// user defualts

let LOGGED_IN_KEY = "loggedin"
let TOKEN_KEY = "token"
let USER_MAIL = "userem"

// urls Constants

let base_url = "http://192.168.2.191:3005/v1"
let url_register = "\(base_url)/account/register"
let url_login = "\(base_url)/account/login"
let url_user_add = "\(base_url)/user/add"
let url_findUser_by_email = "\(base_url)/user/byEmail/"
let url_channels = "\(base_url)/channel"
let url_get_messages = "\(base_url)/message/byChannel"

// headers
let HEADER = [
    "Content-Type" : "application/json; charset=utf-8"
]
let Berrer_header = [
    "Authorization": "Bearer \(AuthService.instance.authtoken)",
    "Content-Type" : "application/json; charset=utf-8"]

// colors

let smackpurbleColor = #colorLiteral(red: 0.3254901961, green: 0.4196078431, blue: 0.7764705882, alpha: 0.5)

// notifications

let notify_user_data_did_changed = Notification.Name("notifUserDataChanged")
let notify_channels_loaded = Notification.Name("channelloaded")
let notify_channels_selected = Notification.Name("channelselected")
