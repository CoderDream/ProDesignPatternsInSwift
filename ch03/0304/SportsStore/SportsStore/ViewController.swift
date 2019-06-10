//
//  ViewController.swift
//  SportsStore
//
//  Created by CoderDream on 2019/6/10.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var totalStockLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var products = [
        ("Kayak", "A boat for one person", "Watersports", 275.0, 10),
        ("Lifejacket", "Protective and fashionable", "Watersports", 48.95, 14),
        ("Soccer Ball", "FIFA-approved size and weight", "Soccer", 19.5, 32),
        ("Corner Flags", "Give your playing field a professional touch",
         "Soccer", 34.95, 1),
        ("Stadium", "Flat-packed 35,000-seat stadium", "Soccer", 79500.0, 4),
        ("Thinking Cap", "Improve your brain efficiency by 75%", "Chess", 16.0, 8),
        ("Unsteady Chair", "Secretly give your opponent a disadvantage",
         "Chess", 29.95, 3),
        ("Human Chess Board", "A fun game for the family", "Chess", 75.0, 2),
        ("Bling-Bling King", "Gold-plated, diamond-studded King",
         "Chess", 1200.0, 4)]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        displayStockTotal();
        
        //self.tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 50))
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        //self.tableView.register(ProductTableCell.self, forCellReuseIdentifier: "ProductCell")
        
        // 设置表视图的表脚视图
        tableView.tableFooterView = UIView()
    }

    func displayStockTotal() {
        let stockTotal = products.reduce(0,
                                         {(total, product) -> Int in return total + product.4});
        totalStockLabel.text = "\(stockTotal) Products in Stock";
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indentifier = "ProductTableCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: indentifier) as? ProductTableCell
        if cell == nil {
            cell = Bundle.main.loadNibNamed("ProductTableCell", owner: self, options: nil)?.last as? ProductTableCell
            let product = products[indexPath.row];
            cell?.productId = indexPath.row;
            cell?.nameLabel?.text = product.0;
            cell?.descriptionLabel?.text = product.1;
            cell?.stockStepper?.value = Double(product.4);
            cell?.stockField?.text = String(product.4);
        }

        return cell!;
    }
}

