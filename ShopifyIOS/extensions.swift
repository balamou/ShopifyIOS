//
//  extensions.swift
//  ShopifyIOS
//
//  Created by Michel Balamou on 2018-09-21.
//  Copyright © 2018 Michel Balamou. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func loadCache(link: String, contentMode mode: UIViewContentMode)
    {
        let url = URL(string: link)!
        self.contentMode = mode
        self.kf.setImage(with: url)
    }
    
}
