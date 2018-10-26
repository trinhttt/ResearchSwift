//
//  CommonResponse.swift
//  FoodDelivery
//
//  Created by Trinh Thai on 10/10/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import Foundation
import ObjectMapper
class CommonResponse: Mappable {
    
    //login
    var msg: String?
    var token: String?
    
    //register
    var id: Int?
    
    //food
//    var foodList : [Food]?
    
    //restaurant
    var restaurant: Restaurant?
    var menu: Menu?
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        msg <- map["msg"]
        token <- map["token"]
        id <- map["id"]
//        foodList <- map[""]
        menu <- map["menu"]
        restaurant <- map["restaurant"]

    }
}
class Menu: Mappable{
    required init?(map: Map) {
    }
    
    var id: Int?
    var name : String?
    var idFoodCategory: Int?
    var idRestaurant: Int?
    var image: String?
    var price: Int?
    var sold: Int?
    
    func mapping(map: Map) {
        
        id <- map["id"]
        name <- map["name"]
        idFoodCategory <- map["idFoodCategory"]
        idRestaurant <- map["idRestaurant"]
        image <- map["image"]
        price <- map["price"]
        sold <- map["sold"]
    }
}
class Restaurant: Mappable{
    required init?(map: Map) {
    }
    
    var id: Int?
    var name : String?
    var idAddress: Int?
    var rating: Int?
    var image: String?
//    var timeOpen: Int?
//    var timeClose: Int?
    
    func mapping(map: Map) {
        
        id <- map["id"]
        name <- map["name"]
        idAddress <- map["idAddress"]
        rating <- map["rating"]
        image <- map["image"]
//        timeOpen <- map["timeOpen"]
//        timeClose <- map["timeClose"]
    }
}

class Food: Mappable{
    required init?(map: Map) {
    }
    
    var id: Int?
    var name : String?
    var idFoodCategory: Int?
    var idRestaurant: Int?
    var price: Int?
    var sold: Int?
    var image: String?
    
    func mapping(map: Map) {
      
        id <- map["id"]
        name <- map["name"]
        idFoodCategory <- map["idFoodCategory"]
        idRestaurant <- map["idRestaurant"]
        price <- map["price"]
        sold <- map["sold"]
        image <- map["image"]
    }
}
