//
//  Menu.swift
//  TryApp
//
//  Created by RealityFamily on 28/09/2019.
//  Copyright © 2019 RealityFamily. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController : UIViewController, UINavigationControllerDelegate {
    
    var data : [Food] = []
    
    var restaurant : Restaurant = Restaurant.init()
    
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Mark: UILabel!
    @IBOutlet weak var Image: UIImageView!
    
    @IBOutlet weak var MenuTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = getArray()
        
        self.navigationController?.isNavigationBarHidden = false
        
        Name.text = restaurant.name
        Mark.text = String(restaurant.mark)
        if let image = restaurant.image{
            Image.image = image
        }
        MenuTableView.reloadData()
        MenuTableView.delegate = self
        MenuTableView.dataSource = self
    }
    
    func getArray() -> [Food] {
        var temp_array : [Food] = []
        
        let Food1 = Food.init(name: "Чизбургер", description: "", price: 50.0, image: nil)
        let Food2 = Food.init(name: "БигМак", description: "", price: 50, image: nil)
        let Food3 = Food.init(name: "БигТести", description: "", price: 50, image: nil)
        let Food4 = Food.init(name: "Наггетсы", description: "", price: 50, image: nil)
        
        temp_array.append(Food1)
        temp_array.append(Food2)
        temp_array.append(Food3)
        temp_array.append(Food4)
        
        return temp_array
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if self.isMovingFromParent{
            OrderGroups.restaurant = ""
        }
    }
}

extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let food = data[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuCell
        cell.setData(food: food)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let food = data[indexPath.row]
        let foodAbout = self.storyboard?.instantiateViewController(identifier: "FoodAbout") as! FoodViewController
        foodAbout.food = food
        
        navigationItem.title = "Назад"
        
        self.navigationController?.pushViewController(foodAbout, animated: true)
    }
    
}
