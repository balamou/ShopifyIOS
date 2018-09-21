//
//  ProductsViewController.swift
//  ShopifyIOS
//
//  Created by Michel Balamou on 2018-09-20.
//  Copyright © 2018 Michel Balamou. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var productsTable: UITableView!
    var displayProducts: [Product] = []
    var selectedTag: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.title = selectedTag
        
        productsTable.reloadData() // Reload data
    }


    
    //---------------------------------------------------------------------------------------------
    // MARK: - TableView delegate
    //---------------------------------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayProducts.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let productCell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as! ProductTableViewCell
        
        productCell.titleLabel.text = displayProducts[indexPath.row].title
        productCell.vendorLabel.text = displayProducts[indexPath.row].vendor
        productCell.totalInvLabel.text = String(displayProducts[indexPath.row].totalInventory)
        productCell.tagsLabel.text = displayProducts[indexPath.row].getFormattedTags()
        
        return productCell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105.0
    }
}
