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
    var net = NetworkDispatcher()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        net.requestProducts{ _ in
            self.tagTable.reloadData() // Reload data once request has been parsed
        }
    }

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        guard let selectedIndex = self.tagTable.indexPath(for: sender as! UITableViewCell)
        else {
            print("Error: No tag was selected")
            return // EXIT
        }
        
        if segue.identifier == "ShowProductSegue"
        {
            if let destinationVC = segue.destination as? ProductsViewController {
                destinationVC.displayProducts = Product.filterProducts(products: net.products, by: net.tags[selectedIndex.row])
                destinationVC.selectedTag = net.tags[selectedIndex.row]
            }
        }
    }
    
    //---------------------------------------------------------------------------------------------
    // MARK: - TableView delegate
    //---------------------------------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return net.tags.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tagCell = tableView.dequeueReusableCell(withIdentifier: "TagCell") as! TagTableViewCell
        
        tagCell.tagLabel.text = net.tags[indexPath.row]
        
        return tagCell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64.0
    }
    
}

