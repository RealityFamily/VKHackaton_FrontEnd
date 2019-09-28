//
//  MenuCell.swift
//  TryApp
//
//  Created by RealityFamily on 28/09/2019.
//  Copyright © 2019 RealityFamily. All rights reserved.
//

import Foundation
import UIKit

class MenuCell: UITableViewCell {
    
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var Price: UILabel!
    @IBOutlet weak var MainImage: UIImageView!
    
    func setData(food: Food) {
        Name.text = food.Name
        Description.text = food.Description
        Price.text = String(food.Price) + " ₽"
        if let image = food.Image {
            MainImage.image = image
        }
    }
}
