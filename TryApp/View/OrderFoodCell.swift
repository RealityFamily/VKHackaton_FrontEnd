//
//  OrderFoodCell.swift
//  TryApp
//
//  Created by RealityFamily on 29/09/2019.
//  Copyright © 2019 RealityFamily. All rights reserved.
//

import Foundation
import UIKit

class OrderFoodCell: UITableViewCell {
    
    @IBOutlet weak var FoodName: UILabel!
    @IBOutlet weak var FoodPrice: UILabel!
    
    func setData(food: Food) {
        FoodName.text = food.itemName
        if let price = food.price {
            FoodPrice.text = String(price)
        }
    }

}
