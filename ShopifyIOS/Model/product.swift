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
    
    /*
     This static method filters out all products in a list that match a particular tag
     */
    static func filterProducts(products: [Product], by tag: String) -> [Product] {
        var finalProd: [Product] = []
        
        for prod in products {
            if prod.tags.contains(tag) {
                finalProd += [prod]
            }
        }
        
        return finalProd
    }
    
    /*
     This method converts the array of tags into a different format:
     ["Awesome", "Pants", "Silk"] -> "#awesome #pants #silk"
     */
    func getFormattedTags() -> String {
        let lowercase = tags.map{"#" + $0.lowercased()} // make all tags lowercase and add a hashtag infont
        
        return lowercase.joined(separator: " ") // join array by spaces
    }
}
