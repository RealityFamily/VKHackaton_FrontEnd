//
//  CustomCell.swift
//  
//
//  Created by RealityFamily on 27/09/2019.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var NameTextView: UILabel!
    @IBOutlet weak var AdressTextView: UILabel!
    @IBOutlet weak var MarkTextView: UILabel!
    
    func setData(restaurant: Restaurant){
        NameTextView.text = restaurant.name
        AdressTextView.text = restaurant.adress
        MarkTextView.text = String(restaurant.mark)
        if let image = restaurant.image {
            ImageView.image = image
        }
    }
}

