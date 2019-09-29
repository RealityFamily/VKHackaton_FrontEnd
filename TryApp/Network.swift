//
//  Network.swift
//  TryApp
//
//  Created by RealityFamily on 29/09/2019.
//  Copyright © 2019 RealityFamily. All rights reserved.
//

import Foundation
import Alamofire

class Network {
    static let UrlBase : String = "http://192.168.43.99:5000"
    
    static func GetRestaurant(page: Int, success: @escaping (_ answer : [Restaurant]) -> Void){
        
        request(UrlBase + "/RestInfo/GetRestaurants/" + String(page), method: .get).responseString(encoding: String.Encoding.utf8)
        {response in
            switch response.result{
            case .success(_):
                let responseData = response.data!
                let Restaurants = try! JSONDecoder().decode([Restaurant].self, from: responseData)
                success(Restaurants)
            case .failure(_):
                return
                
            }
        }
    }
    
    static func GetMenu(restaurantId: String, success: @escaping (_ answer: [Food]) -> Void){
        request(UrlBase + "/RestInfo/menu/" + restaurantId, method: .get).responseString(encoding: String.Encoding.utf8)
        {response in
            switch response.result {
            case .success(_):
                print(response)
                let responseData = response.data!
                let food = try! JSONDecoder().decode([Food].self, from: responseData)
                success(food)
            case .failure(_):
                return
            }
        }
    }
    
    static func GetAdress(restaurantName: String, success: @escaping (_ answer: [Restaurant]) -> Void){
        request(UrlBase + "/RestInfo/GetInfo/" + restaurantName, method: .get).responseString(encoding: String.Encoding.utf8)
        {response in
            switch response.result {
            case .success(_):
                let responseData = response.data!
                let restaurant = try! JSONDecoder().decode([Restaurant].self, from: responseData)
                success(restaurant)
            case .failure(_):
                return
            }
        }
    }
    
    static func SendOrder(order: Order, success: @escaping (_ answer: String) -> Void){
        let param = order.dictionary
        
        request(UrlBase + "/Order/New", method: .post, parameters: param!).validate().responseString(encoding: String.Encoding.utf8)
        {response in
            switch response.result {
            case .success(_):
                let responseData = response.data!
                let order = try! JSONDecoder().decode(Order.self, from: responseData)
            case .failure(_):
                return
            }
        }
    }
}
