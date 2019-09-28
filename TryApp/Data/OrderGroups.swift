//
//  OrderGroups.swift
//  TryApp
//
//  Created by RealityFamily on 28/09/2019.
//  Copyright © 2019 RealityFamily. All rights reserved.
//

import Foundation

class ConnectedOrders {
    var ShoppingCenter : String
    var Cost : Float
    var Orders : [Order]
    
    init() {
        self.ShoppingCenter = ""
        self.Cost = 0.0
        self.Orders = []
    }
}

class OrderGroups {
    static var tempOrder : Order = Order.init()
    static var shoppingCenterOrders : [ConnectedOrders] = []
    static var restaurantOrders : [Order] = []
    
    static func AddToRestaurantOrders() {
        for order in restaurantOrders{
            if (order.Restaurant == tempOrder.Restaurant){
                for food in tempOrder.OrderStructure {
                    order.OrderStructure.append(food)
                }
                return
            }
        }
        restaurantOrders.append(tempOrder)
    }
    
    static func CreateShoppingCenterOrders(shoppingcenter: String) {
        var Coast : Float = 0.0
        
    }
}
