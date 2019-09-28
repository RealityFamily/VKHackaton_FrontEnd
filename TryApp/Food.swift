//
//  Food.swift
//  TryApp
//
//  Created by RealityFamily on 28/09/2019.
//  Copyright © 2019 RealityFamily. All rights reserved.
//

import Foundation
import UIKit

class Food {
    var Name : String
    var Description : String
    var Price : Float
    var Image : UIImage?
    
    init(name: String, description: String, price: Float, image: UIImage?) {
        Name = name
        Description = description
        Price = price
        Image = image
    }
    
    init() {
        Name = ""
        Description = ""
        Price = 0.0
        Image = nil
    }
}
