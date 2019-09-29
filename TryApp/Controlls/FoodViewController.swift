//
//  FoodViewController.swift
//  TryApp
//
//  Created by RealityFamily on 28/09/2019.
//  Copyright © 2019 RealityFamily. All rights reserved.
//

import Foundation
import UIKit

class FoodViewController: UIViewController {
    
    var food : Food = Food.init()
    
    @IBOutlet weak var MainImage: UIImageView!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Price: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var Count: UILabel!
    @IBOutlet weak var FullPrice: UILabel!
    @IBOutlet weak var Stepper: UIStepper!
    
    @IBAction func ChangeStepper(_ sender: UIStepper) {
        Count.text = String(Int(sender.value))
        if let price = food.price {
            FullPrice.text = "Итого: " + String(Float(Int(sender.value)) * price) + "₽"
        }
    }
    
    @IBAction func AddToOrder(_ sender: UIButton) {
        if (Int(Stepper.value) > 0) {
        
            for _ in 1...Int(Stepper.value){
                OrderGroups.orderStructure.append(food)
            }
            if let price = food.price {
                OrderGroups.price = Float(Int(Stepper.value)) * price
            }
        
            OrderGroups.AddToRestaurantOrders()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let Image = food.image {
            let uri = Network.UrlBase + "/" + Image
            let encodedUri = uri.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
            MainImage.downloaded(from: encodedUri, mode: .scaleAspectFill)
        }
        if let name = food.itemName {
            Name.text = name
        }
        if let price = food.price {
            Price.text = String(price)
        }
        if let description = food.describe {
            Description.text = description
        }
        
        Count.text = String(0)
        FullPrice.text = "Итого: 0₽"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        OrderGroups.orderStructure = []
    }
}
