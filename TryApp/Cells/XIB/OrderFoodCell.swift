//
//  OrderFoodCell.swift
//  TryApp
//
//  Created by RealityFamily on 28/09/2019.
//  Copyright © 2019 RealityFamily. All rights reserved.
//

import UIKit

class OrderFoodCell: UITableViewCell {
    
    @IBOutlet weak var FoodName: UILabel!
    @IBOutlet weak var FoodPrice: UILabel!
    
    func setData(food: Food) {
        FoodName.text = food.Name
        FoodPrice.text = String(food.Price)
    }

}
