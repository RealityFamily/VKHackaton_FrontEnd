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
    
    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}

extension CartViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell = UITableViewCell.init()
        
        
        return cell
    }
}
