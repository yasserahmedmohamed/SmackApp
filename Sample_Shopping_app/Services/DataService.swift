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
    
    private let shirstProduct=[
    Product(forimage: "shirt01.jpg", forname: "shirt 1", forprice: "$150"),
        Product(forimage: "shirt02.jpg", forname: "shirt 2", forprice: "$150"),
        Product(forimage: "shirt03.jpg", forname: "shirt 3", forprice: "$150"),
        Product(forimage: "shirt04.jpg", forname: "shirt 4", forprice: "$150"),
        Product(forimage: "shirt05.jpg", forname: "shirt 5", forprice: "$150")

    ]
    private let hoodiesProduct=[
    
        Product(forimage: "hoodie01.jpg", forname: "hoodie 1", forprice: "$200"),
        Product(forimage: "hoodie02.jpg", forname: "hoodie 2", forprice: "$200"),
        Product(forimage: "hoodie03.jpg", forname: "hoodie 3", forprice: "$200"),
        Product(forimage: "hoodie04.jpg", forname: "hoodie 4", forprice: "$200"),

    ]
    private let hatProduct=[
        Product(forimage: "hat01.jpg", forname: "hat 1", forprice: "$100"),
        Product(forimage: "hat02.jpg", forname: "hat 2", forprice: "$100"),
        Product(forimage: "hat03.jpg", forname: "hat 3", forprice: "$100"),
        Product(forimage: "hat04.jpg", forname: "hat 4", forprice: "$100"),

    ]
    
    func getcategories()->[Category]
    {
        return categories
    }
    func getProducts(selectedCategory:Category) -> [Product] {
        
        switch selectedCategory.categoryname {
        case "Shirts":
            return shirstProduct
        case "hoodies":
            return hoodiesProduct
        case "hats":
            return hatProduct
        default:
            return [Product]()
        }
    }
}
