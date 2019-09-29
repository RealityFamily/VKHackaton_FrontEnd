//
//  CustomCell.swift
//  
//
//  Created by RealityFamily on 27/09/2019.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var NameTextView: UILabel!
    @IBOutlet weak var MarkTextView: UILabel!
    
    func setData(restaurant: Restaurant){
        if let name = restaurant.name {
            NameTextView.text = name
        }
        if let rate = restaurant.rate{
            MarkTextView.text = String(rate)
        }
        if let image = restaurant.image {
            let uri = Network.UrlBase + "/" + image
            let encodedUri = uri.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
            ImageView.downloaded(from: encodedUri, mode: .scaleAspectFill)
        }
    }
}

