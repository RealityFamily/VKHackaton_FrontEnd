//
//  OrderGroups.swift
//  TryApp
//
//  Created by RealityFamily on 28/09/2019.
//  Copyright © 2019 RealityFamily. All rights reserved.
//

import Foundation

class ConnectedOrders {
    var ShoppingCenter : String = ""
    var Cost : Float = 0.0
    var Orders : [Order] = []
}

class OrderGroups {
    static var orderStructure : [Food] = []
    static var restaurant : String = ""
    static var price : Float = 0.0
    
    static var shoppingCenterOrders : [ConnectedOrders] = []
    static var restaurantOrders : [Order] = []
    
    
    
    static func AddToRestaurantOrders() {
        let tempOrder : Order = Order.init(shoppingcenter: "", adress: "", orderstructure: orderStructure, restaurant: restaurant, price: price, paid: false)
        
        for order in restaurantOrders{
            if (order.Restaurant == tempOrder.Restaurant){
                for food in tempOrder.OrderStructure {
                    order.OrderStructure.append(food)
                }
                order.Price += tempOrder.Price
                return
            }
        }
        restaurantOrders.append(tempOrder)
    }
    
    static func clear() {
        orderStructure = []
        restaurant = ""
        price = 0.0
    }
    
    static func CreateShoppingCenterOrders(shoppingcenter: String) {
        var Coast : Float = 0.0
        
    }
    
    static func GetOrdersFromShoppingCenterOrders(index: Int) -> [Order] {
        return OrderGroups.shoppingCenterOrders[index].Orders
    }
}
