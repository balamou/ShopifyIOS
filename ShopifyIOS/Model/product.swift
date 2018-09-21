//
//  product.swift
//  ShopifyIOS
//
//  Created by Michel Balamou on 2018-09-20.
//  Copyright © 2018 Michel Balamou. All rights reserved.
//

import Foundation


class Product: CustomStringConvertible {
    // basic info
    var title: String // Product tile (Ex. Aerodynamic Cotton Keyboard)
    var totalInventory: Int // total available inventory
    
    // more info
    var vendor: String
    var imageURL: String
    var tags: [String] = [] // tags of the product (Ex. Aerodynamic, Clock, Concrete)
    
    // Returns a string representing the Product Object
    var description: String {
        var tmp = "--------\n"
        tmp+="Title: \(self.title)\n"
        tmp+="Total Inv: \(totalInventory)\n"
        tmp+="Vendor: \(vendor)\n"
        tmp+="ImageSrc: \(imageURL)\n"
        tmp+="Tags: \(tags)\n"
        tmp+="--------"
        
        return tmp
    }
    
    init(title: String, totalInventory: Int, vendor: String, imageURL: String) {
        self.title = title
        self.totalInventory = totalInventory
        self.vendor = vendor
        self.imageURL = imageURL
    }
}
