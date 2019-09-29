//
//  MenuCell.swift
//  TryApp
//
//  Created by RealityFamily on 28/09/2019.
//  Copyright © 2019 RealityFamily. All rights reserved.
//

import Foundation
import UIKit

class MenuCell: UITableViewCell {
    
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Price: UILabel!
    @IBOutlet weak var MainImage: UIImageView!
    
    func setData(food: Food) {
        if let name = food.itemName {
            Name.text = name
        }
        if let price = food.price {
            Price.text = String(price) + " ₽"
        }
        if let Image = food.image {
            let uri = Network.UrlBase + "/" + Image
            let encodedUri = uri.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
            MainImage.downloaded(from: encodedUri, mode: .scaleAspectFill)
        }
        
        
    }
}

extension UIImageView {
    func downloaded(from url: URL, mode: UIView.ContentMode) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        print("Started...")
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            print("Done")
        }.resume()
    }
    func downloaded(from link: String, mode: UIView.ContentMode) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, mode: mode)
    }
}
