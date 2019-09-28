//
//  Restaurant.swift
//  TryApp
//
//  Created by RealityFamily on 27/09/2019.
//  Copyright © 2019 RealityFamily. All rights reserved.
//

import Foundation
import UIKit

class Restaurant {
    var name : String
    var adress : String
    var mark : Float
    var image: UIImage?
    
    init(name: String, adress: String, mark: Float, image: UIImage?) {
        self.name = name
        self.adress = adress
        self.mark = mark
        self.image = image
    }
    
    init() {
        self.name = ""
        self.adress = ""
        self.mark = 0.0
        self.image = nil
    }
}
