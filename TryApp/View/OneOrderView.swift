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
        
        order = order_in
        
        OrderTableView.reloadData()
        
        OrderTableView.delegate = self
        OrderTableView.dataSource = self
        
        RestaurantName.text = order_in.Restaurant
        if (order_in.ShoppingCenter == "" && order_in.Adress == "") {
            ShoppingCenterNameAndPlace.isHidden = true
        } else {
            guard let unwrapped = order_in.ShoppingCenter else { return }
            guard let unwrapped1 = order_in.Adress else { return }
            ShoppingCenterNameAndPlace.text = unwrapped + " " + unwrapped1
        }
    }
    
    
}

extension OneOrderView: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let unwrapped = order.OrderStructure else { return 0 }
        return unwrapped.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let unwrapped = order.OrderStructure else { return UITableViewCell() }
        let food = unwrapped[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderFoodCell", for: indexPath) as! OrderFoodCell
        cell.setData(food: food)
        
        return cell
    }
}



