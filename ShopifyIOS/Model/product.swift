//
//  product.swift
//  ShopifyIOS
//
//  Created by Michel Balamou on 2018-09-20.
//  Copyright © 2018 Michel Balamou. All rights reserved.
//

import Foundation


class Product {
    var name: String
    var totalInventory: Int // total available inventory
    
    init(name: String, totalInventory: Int) {
        self.name = name
        self.totalInventory = totalInventory
    }
}
