//
//  MoreOrderView.swift
//  TryApp
//
//  Created by RealityFamily on 28/09/2019.
//  Copyright © 2019 RealityFamily. All rights reserved.
//

import UIKit

class MoreOrderView: UITableViewCell {
    
    var orders: [Order] = []

    
    @IBOutlet weak var ShoppingCenterNameAndAdress: UILabel!
    @IBOutlet weak var OrderList: UITableView!
    
    func setData (orders_in: [Order]) {
        OrderList.register(UINib(nibName: "RestaurantOrders", bundle: nil), forCellReuseIdentifier: "RestaurantOrders")
        
        orders = orders_in
        
        ShoppingCenterNameAndAdress.text = orders_in[0].Restaurant + " " + orders_in[0].Adress
    }

}

extension MoreOrderView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let order = orders[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantOrders", for: indexPath) as! RestaurantOrders
        cell.setData(order_in: order)
        
        return cell
    }
}

