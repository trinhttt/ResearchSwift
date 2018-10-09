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
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        msg <- map["msg"]
        token <- map["token"]
        id <- map["id"]
    }
}
