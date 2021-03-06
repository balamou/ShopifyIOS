//
//  ProductTableViewCell.swift
//  ShopifyIOS
//
//  Created by Michel Balamou on 2018-09-21.
//  Copyright © 2018 Michel Balamou. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var vendorLabel: UILabel!
    @IBOutlet weak var totalInvLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
