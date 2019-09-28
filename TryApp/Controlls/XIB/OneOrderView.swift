//
//  OneOrderView.swift
//  
//
//  Created by RealityFamily on 28/09/2019.
//

import UIKit

class OneOrderView: UIView {
    
    var order : Order = Order.init()

    @IBOutlet weak var RestaurantName: UILabel!
    @IBOutlet weak var ShoppingCenterNameAndPlace: UILabel!
    @IBOutlet weak var OrderTableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func commonInit() {
        Bundle.main.loadNibNamed("OneOrderView", owner: self, options: nil)
        
        OrderTableView.register(UINib(nibName: "OrderFoodCell", bundle: nil), forCellReuseIdentifier: "OrderFoodCell")
    }
    
    func setData(order_in: Order) {
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
