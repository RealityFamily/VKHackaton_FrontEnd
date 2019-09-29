//
//  RestaurantOrders.swift
//  TryApp
//
//  Created by RealityFamily on 28/09/2019.
//  Copyright © 2019 RealityFamily. All rights reserved.
//

import UIKit

class RestaurantOrders: UITableViewCell {
    
    var order: Order = Order.init()

    @IBOutlet weak var RestaurantName: UILabel!
    @IBOutlet weak var OrderFoodList: UITableView!
    
    func setData(order_in: Order) {
        order = order_in
        
        OrderFoodList.register(UINib(nibName: "OrderFoodCell", bundle: nil), forCellReuseIdentifier: "OrderFoodCell")
        
        RestaurantName.text = order_in.Restaurant
    }

}

extension RestaurantOrders: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return order.OrderStructure!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let food = order.OrderStructure![indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderFoodCell", for: indexPath) as! OrderFoodCell
        cell.setData(food: food)
        
        return cell
    }
}
