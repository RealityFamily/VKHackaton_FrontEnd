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
        
        Network.GetMenu(restaurantId: restaurant.restaurantId! , success: {
            answer in
            self.data = answer
            self.MenuTableView.reloadData()
        })
        
        self.navigationController?.isNavigationBarHidden = false
        
        if let name = restaurant.name{
            Name.text = name
        }
        if let rate = restaurant.rate{
            Mark.text = String(rate)
        }
        if let image = restaurant.image{
            let uri = Network.UrlBase + "/" + image
            let encodedUri = uri.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
            Image.downloaded(from: encodedUri, mode: .scaleAspectFill)
        }
        MenuTableView.reloadData()
        MenuTableView.delegate = self
        MenuTableView.dataSource = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if self.isMovingFromParent{
            OrderGroups.orderStructure = []
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

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
