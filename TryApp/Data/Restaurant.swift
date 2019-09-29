//
//  Restaurant.swift
//  TryApp
//
//  Created by RealityFamily on 27/09/2019.
//  Copyright © 2019 RealityFamily. All rights reserved.
//

import Foundation
import UIKit

class Restaurant : Codable{
    var restaurantId : String?
    var name : String?
    var adress : String?
    var rate : Float?
    var image: String?
    
    init(name: String, adress: String, mark: Float, image: String?) {
        self.name = name
        self.adress = adress
        self.rate = mark
        self.image = image
    }
    
    init() {
        self.name = ""
        self.adress = ""
        self.rate = 0.0
        self.image = nil
    }
    
    
}
