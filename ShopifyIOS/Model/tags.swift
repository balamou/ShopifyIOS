//
//  tags.swift
//  ShopifyIOS
//
//  Created by Michel Balamou on 2018-09-20.
//  Copyright © 2018 Michel Balamou. All rights reserved.
//

import Foundation
import Alamofire

class TagsProcessor {
    
    var tags : [String]?
    
    init() {
        
    }
    
    
    func requestTags() {
        Alamofire.request("https://shopicruit.myshopify.com/admin/products.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
        }
    }
}
