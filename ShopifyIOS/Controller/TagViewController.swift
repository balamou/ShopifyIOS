//
//  ViewController.swift
//  ShopifyIOS
//
//  Created by Michel Balamou on 2018-09-20.
//  Copyright © 2018 Michel Balamou. All rights reserved.
//

import UIKit

class TagViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var tagTable: UITableView!

    var tags: [String] = []
    var products: [Product] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let net = NetworkDispatcher()
        net.requestProducts{ tags, products in
            self.tags = tags
            self.products = products
            
            self.tagTable.reloadData() // Reload data once request has been parsed
        }
    }

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "ShowProductSegue"
        {
            guard let selectedIndex = self.tagTable.indexPath(for: sender as! UITableViewCell)
                else {
                    print("Error: No tag was selected")
                    return // EXIT
            }
            
            if let destinationVC = segue.destination as? ProductsViewController {
                destinationVC.displayProducts = Product.filterProducts(products: products, by: tags[selectedIndex.row])
                destinationVC.selectedTag = tags[selectedIndex.row]
            }
        }
    }
    
    //---------------------------------------------------------------------------------------------
    // MARK: - TableView delegate
    //---------------------------------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tags.count; // retunr the number of tags
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tagCell = tableView.dequeueReusableCell(withIdentifier: "TagCell") as! TagTableViewCell
        
        tagCell.tagLabel.text = tags[indexPath.row]
        
        return tagCell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64.0
    }
    
}

