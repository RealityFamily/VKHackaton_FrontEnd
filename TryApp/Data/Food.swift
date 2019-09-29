//
//  Food.swift
//  TryApp
//
//  Created by RealityFamily on 28/09/2019.
//  Copyright © 2019 RealityFamily. All rights reserved.
//

import Foundation
import UIKit

class Food : Codable{
    var menuItemId : String?
    var itemName : String?
    var describe : String?
    var price : Float?
    var image : String?
    
    init(Name: String, Description: String, Price: Float, Image: String?) {
        itemName = Name
        describe = Description
        price = Price
        image = Image
    }
    
    init() {
        itemName = ""
        describe = ""
        price = 0.0
        image = nil
    }
}
