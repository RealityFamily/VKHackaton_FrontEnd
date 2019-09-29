//
//  CartViewController.swift
//  TryApp
//
//  Created by RealityFamily on 28/09/2019.
//  Copyright © 2019 RealityFamily. All rights reserved.
//

import Foundation
import UIKit

class CartViewController : UIViewController {
    
    @IBOutlet weak var Settings: UIView!
    @IBOutlet weak var Payment: UIView!
    @IBOutlet weak var Separ: UIView!
    
    @IBOutlet weak var ActivityButton: UIButton!
    
    @IBOutlet weak var ItemsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ItemsTableView.delegate = self
        ItemsTableView.dataSource = self
        
        if (OrderGroups.restaurantOrders.count >= 0) {
            if (OrderGroups.restaurantOrders.count == 0) {
                ActivityButton.isHidden = true
            }
            Settings.isHidden = true
            Payment.isHidden = true
            Separ.isHidden = true
            ActivityButton.setTitle("Выбрать Торговый Центр", for: .normal)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        ItemsTableView.reloadData()
    }
}

extension CartViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let i = OrderGroups.shoppingCenterOrders.count + OrderGroups.restaurantOrders.count
        return i
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row < OrderGroups.shoppingCenterOrders.count) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MoreOrderView", for: indexPath) as! MoreOrderView
            cell.setData(orders_in: (OrderGroups.GetOrdersFromShoppingCenterOrders(index: indexPath.row)))
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "OneOrderView", for: indexPath) as! OneOrderView
            cell.setData(order_in: (OrderGroups.restaurantOrders[indexPath.row]))
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            if (indexPath.row < OrderGroups.shoppingCenterOrders.count) {
                OrderGroups.shoppingCenterOrders.remove(at: indexPath.row)
                tableView.reloadData()
            } else {
                let index = indexPath.row - OrderGroups.shoppingCenterOrders.count
                OrderGroups.restaurantOrders.remove(at: index)
                tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
}
