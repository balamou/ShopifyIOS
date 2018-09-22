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
        
        addNavBar() // change the style of the nav bar
        
        let net = NetworkDispatcher()
        // Make a request to the Shopify's JSON API
        net.requestProducts{ tags, products in
            self.tags = tags
            self.products = products
            
            self.tagTable.reloadData() // Reload data once request has been parsed
        }
    }
    
    func addNavBar() {
        let navController = navigationController!
        //navController.navigationBar.barTintColor = #colorLiteral(red: 0.4117647059, green: 0.5490196078, blue: 0.2823529412, alpha: 1)
        
        let image:UIImage = #imageLiteral(resourceName: "shopify")
        let imageView = UIImageView(image: image)
        
        let bannerWidth = navController.navigationBar.frame.size.width
        let bannerHeight = navController.navigationBar.frame.size.height
        
        let bannerX = bannerWidth/2 - image.size.width/2
        let bannerY = bannerHeight/2 - image.size.height/2
        
        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
        imageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = imageView
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

