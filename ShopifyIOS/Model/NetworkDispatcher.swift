//
//  tags.swift
//  ShopifyIOS
//
//  Created by Michel Balamou on 2018-09-20.
//  Copyright © 2018 Michel Balamou. All rights reserved.
//

import Foundation
import Alamofire


/*
 This class sends a request to the Shopify API and returns an array of products.
 
 ** Normally I would separate the HTTP requests (NetworkDispatcher) and the JSON parsing in separate classes
    but considering there is just one request I put them all in one class for simplicity.
 */
class NetworkDispatcher {
    
    var tags : [String] = []
    var products : [Product] = []
    
    /*
     This functions makes a request to Shopify's rest API.
     The result JSON is parsed for tags only and a string array
     is produced and further processed in the completion handler.
     
     completion:
     */
    func requestProducts(completion: @escaping ([String], [Product])  -> () )
    {
        Alamofire.request("https://shopicruit.myshopify.com/admin/products.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6").responseJSON { response in
            
            if let json = response.result.value
            {
                self.materializeProducts(json) // convert the json into a Product array
                completion(self.tags, self.products)
            }
        }
    }
    
    /*
     This function parses the JSON into an array of Product objects
     */
    private func materializeProducts(_ json: Any)
    {
        guard let total = json as? [String: Any],
              let products = total["products"] as? [[String : Any]]
        else
        {
            print("An error ocurred while parsing products")
            return // EXIT
        }
        
        var setTags: Set<String> = []
        
        for p in products { // loop through all products
            
            guard let title = p["title"] as? String,
                let image = p["image"] as? [String: Any],
                let src = image["src"] as? String,
                let vendor = p["vendor"] as? String,
                let tags = p["tags"] as? String
            else {
                print("An error ocurred while parsing products")
                
                return // EXIT
            }
            
            // Calculate the Total Inventory
            var totalQuant = 0
            
            if let variants = p["variants"] as? [[String: Any]]
            {
                for v in variants
                {
                    if let quant = v["inventory_quantity"] as? Int {
                        totalQuant += quant;
                    }
                }
            }
            
            // Add all parsed data into a Product class and then add that object into an Array
            let productToAdd = Product(title: title, totalInventory: totalQuant, vendor: vendor, imageURL: src)
            
            let sepTags = tags.components(separatedBy: ", ") // separates the tags into an array
            productToAdd.tags = sepTags // add separated tags to the product
            setTags = setTags.union(Set(sepTags)) // union those tags with previously fetched tags
            
            self.products += [productToAdd] // add product to final array
            
            print(productToAdd)
        }
        
        self.tags = Array(setTags).sorted()
        print(tags)
    }
}
