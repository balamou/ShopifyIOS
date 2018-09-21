//
//  product.swift
//  ShopifyIOS
//
//  Created by Michel Balamou on 2018-09-20.
//  Copyright © 2018 Michel Balamou. All rights reserved.
//

import Foundation


class Product {
    // basic info
    var title: String // Product tile (Ex. Aerodynamic Cotton Keyboard)
    var totalInventory: Int // total available inventory
    
    // more info
    var vendor: String
    var tags: [String] = [] // tags of the product (Ex. Aerodynamic, Clock, Concrete)
    
    init(title: String, totalInventory: Int, vendor: String) {
        self.title = title
        self.totalInventory = totalInventory
        self.vendor = vendor
    }
}
