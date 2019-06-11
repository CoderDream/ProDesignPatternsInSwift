//
//  ProductTableCell.swift
//  SportsStore
//
//  Created by CoderDream on 2019/6/10.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ProductTableCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var stockStepper: UIStepper!
    @IBOutlet weak var stockField: UITextField!
    
    var productId:Int?;

    @IBAction func stockLevelDidChange(_ sender: Any) {
        print("stockLevelDidChange")
        
        if var currentCell = sender as? UIView {
            while (true) {
                currentCell = currentCell.superview!;
                if let cell = currentCell as? ProductTableCell {
                    if let id = cell.productId {
                        
                        var newStockLevel:Int?;
                        
                        if let stepper = sender as? UIStepper {
                            newStockLevel = Int(stepper.value);
                        } else if let textfield = sender as? UITextField {
                            if let newValue = Int(textfield.text!) {
                                newStockLevel = newValue;
                            }
                        }
                        
                        print("id: \(id),  newStockLevel: \(String(describing: newStockLevel))")
                        if let level = newStockLevel {
                            //products[id].4 = level;
                            cell.stockStepper.value = Double(level);
                            cell.stockField.text = String(level);
                        }
                    }
                    break;
                }
            }
            //displayStockTotal();
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
