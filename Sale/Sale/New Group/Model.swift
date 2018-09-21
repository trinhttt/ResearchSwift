//
//  Object.swift
//  Sale
//
//  Created by Thai Thi Tu Trinh on 8/24/18.
//  Copyright © 2018 Trinh Thai. All rights reserved.
//

import Foundation

struct Menu:Decodable {
    var id:String = ""
    var title:String = ""
    var icon_small:String = ""
}

struct Slide_home:Decodable {
    var id:String = ""
    var img_source: String = ""
 
}
struct MenuSuggest:Decodable {
    var id:String = ""
   
}
struct Category:Decodable {
    var name:String = ""
    var slug:String = ""
    var products : [Product] = []
}

struct Product:Decodable {
    var id:String = ""
    var image:String = ""
    var title:String = ""
    var slug:String = ""
    var price:Int = 0
    var price_calded:Int = 0
}
struct Home_news:Decodable {
    var id:String = ""
    var title:String = ""
    var created_date:String = ""
    var short_content:String = ""
    var image:String = ""
}

struct arrData:Decodable{
    var menu : [Menu] = []
    var slide_home : [Slide_home] = []
    var menuSuggest : [MenuSuggest] = []
    var category : [Category] = []
    var home_news : [Home_news] = []

}
struct managerData:Decodable{
    var code:Int = 1
    var msg:String = ""
    var data : arrData = arrData()
}
