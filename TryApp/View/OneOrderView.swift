//
//  OneOrderView.swift
//  
//
//  Created by RealityFamily on 28/09/2019.
//

import UIKit

class OneOrderView: UITableViewCell {
    
    var order : Order = Order.init()

    @IBOutlet weak var RestaurantName: UILabel!
    @IBOutlet weak var ShoppingCenterNameAndPlace: UILabel!
    @IBOutlet weak var OrderTableView: UITableView!
    
    func setData(order_in: Order) {
        OrderTableView.register(UINib(nibName: "OrderFoodCell", bundle: nil), forCellReuseIdentifier: "OrderFoodCell")
        
        order = order_in
        
        RestaurantName.text = order_in.Restaurant
        ShoppingCenterNameAndPlace.text = order_in.ShoppingCenter + " " + order_in.Adress
    }
}

extension OneOrderView: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return order.OrderStructure.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let food = order.OrderStructure[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderFoodCell", for: indexPath) as! OrderFoodCell
        cell.setData(food: food)
        
        return cell
    }
}
