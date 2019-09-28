//
//  TableListScreen.swift
//  TryApp
//
//  Created by RealityFamily on 27/09/2019.
//  Copyright © 2019 RealityFamily. All rights reserved.
//

import Foundation
import UIKit

class TableListScreen: UIViewController {
    
    @IBOutlet weak var TableView: UITableView!
    
    var data : [Restaurant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = getArray()
         
        TableView.delegate = self
        TableView.dataSource = self
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func getArray() -> [Restaurant] {
        var temp_array : [Restaurant] = []
        
        let Restaurant1 = Restaurant.init(name: "Макдональдс", adress: "", mark: 4.5, image: nil)
        let Restaurant2 = Restaurant.init(name: "KFC", adress: "", mark: 4.2, image: nil)
        let Restaurant3 = Restaurant.init(name: "Бургер Кинг", adress: "", mark: 3.9, image: nil)
        let Restaurant4 = Restaurant.init(name: "SubWay", adress: "", mark: 4.1, image: nil)
        
        temp_array.append(Restaurant1)
        temp_array.append(Restaurant2)
        temp_array.append(Restaurant3)
        temp_array.append(Restaurant4)
        
        return temp_array
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
}

extension TableListScreen: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Restaurant = data[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as! CustomCell
        cell.setData(restaurant: Restaurant)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let restaurant = data[indexPath.row]
        let moreAbout = self.storyboard?.instantiateViewController(identifier: "MoreAbout") as! MenuViewController
        moreAbout.restaurant = restaurant
        
        OrderGroups.tempOrder.Restaurant = restaurant.name
        
        navigationItem.title = "Назад"
        
        self.navigationController?.pushViewController(moreAbout, animated: true)
    }
}
