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
        
        Network.GetRestaurant(page: 0, success: {
            answer in
            self.data = answer
            self.TableView.reloadData()
        })
         
        TableView.delegate = self
        TableView.dataSource = self
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        OrderGroups.restaurant = ""
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
        
        if let name = restaurant.name {
            OrderGroups.restaurant = name
        }
        
        navigationItem.title = "Назад"
        
        self.navigationController?.pushViewController(moreAbout, animated: true)
    }
}
