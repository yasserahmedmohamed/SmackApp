//
//  Product.swift
//  Sample_Shopping_app
//
//  Created by yasser ahmed on 4/10/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import Foundation

class Product
{
    private var productimage:String
    private var productname:String
    private var prouductprice:String
    
    init(forimage image:String,forname name:String,forprice price:String) {
        productimage=image
        productname=name
        prouductprice=price
    }
    func getname()->String{
        return productname
    }
    func getimage()->String{
        return productimage
    }
    func getprice() -> String {
        return prouductprice
    }
}
