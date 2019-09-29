//
//  Order.swift
//  TryApp
//
//  Created by RealityFamily on 28/09/2019.
//  Copyright © 2019 RealityFamily. All rights reserved.
//

import Foundation

class Order : Codable {
    var orderId : String?
    var ShoppingCenter : String?
    var Adress : String?
    var OrderStructure : [Food]?
    var Restaurant : String?
    var Price : Float?
    var Paid : Bool
    
    init() {
        ShoppingCenter = ""
        Adress = ""
        OrderStructure = []
        Restaurant = ""
        Price = 0.0
        Paid = false
    }
    
    init(shoppingcenter: String, adress: String, orderstructure: [Food], restaurant: String, price: Float, paid: Bool) {
        self.ShoppingCenter = shoppingcenter
        self.Adress = adress
        self.OrderStructure = orderstructure
        self.Restaurant = restaurant
        self.Price = price
        self.Paid = paid
    }
}

extension Encodable {
  var dictionary: [String: Any]? {
    guard let data = try? JSONEncoder().encode(self) else { return nil }
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
  }
}
