//
//  DataService.swift
//  Sample_Shopping_app
//
//  Created by yasser ahmed on 4/9/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import Foundation
class DataService{
    static let inestance=DataService()
    
    private let categories=[
        Category(categoryname: "Shirts", categoryimage: "shirts"),
        Category(categoryname: "hoodies", categoryimage: "hoodies"),
        Category(categoryname: "digital", categoryimage: "digital"),
        Category(categoryname: "hats", categoryimage: "hats")]
    
    func getcategories()->[Category]
    {
        return categories
    }
}
