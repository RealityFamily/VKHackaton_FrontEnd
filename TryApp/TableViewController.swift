//
//  TableVeiwController.swift
//  TryApp
//
//  Created by RealityFamily on 27/09/2019.
//  Copyright © 2019 RealityFamily. All rights reserved.
//

import UIKit

struct CellData {
    let image : UIImage?
    let name : String
    let adress : String?
    let mark : Float?
}

@IBDesignable
class TableViewController : UITableViewController {
    
    var data = [CellData]()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        data = [CellData.init(image: nil, name: "Макдональдс", adress: nil, mark: 4.5 ),
                CellData.init(image: nil, name: "KFC", adress: nil, mark: 4.3 ),
                CellData.init(image: nil, name: "Бургер Кинг", adress: nil, mark: 3.9 ),
                CellData.init(image: nil, name: "SubWay", adress: nil, mark: 4.4 )]
        
        self.tableView.register(CustomCell.self, forCellReuseIdentifier: "custom")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "custom") as! CustomCell
         
        cell.name = data[indexPath.row].name
        cell.adress = data[indexPath.row].adress
        cell.mark = data[indexPath.row].mark
        cell.mainImage = data[indexPath.row].image
        
        cell.layoutSubviews()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
}
