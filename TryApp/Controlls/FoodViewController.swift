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
        FullPrice.text = "Итого: " + String(Float(Int(sender.value)) * food.Price) + "₽"
    }
    
    @IBAction func AddToOrder(_ sender: UIButton) {
        if (Int(Stepper.value) > 0) {
        
            for _ in 1...Int(Stepper.value){
                OrderGroups.orderStructure.append(food)
            }
            OrderGroups.price = Float(Int(Stepper.value)) * food.Price
        
            OrderGroups.AddToRestaurantOrders()
            OrderGroups.clear()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let image = food.Image {
            MainImage.image = image
        }
        Name.text = food.Name
        Price.text = String(food.Price)
        Description.text = food.Description
        
        Count.text = String(0)
        FullPrice.text = "Итого: 0₽"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        OrderGroups.orderStructure = []
    }
}
