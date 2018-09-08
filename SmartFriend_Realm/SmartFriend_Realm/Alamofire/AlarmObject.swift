//
//  Object.swift
//  SmartFriend_Realm
//
//  Created by Thai Thi Tu Trinh on 8/15/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import Foundation
import UIKit


struct ItemList:Decodable {
    var id:String = ""
     var name:String = ""
     var description:String = ""
    var img_url:String = ""
     var category_name:String = ""
    var ingredient_array : [String] = []
}

struct Restaurent:Decodable{
    var status:String = ""
    var message:String = ""
    var item_list:[ItemList] = []
}
