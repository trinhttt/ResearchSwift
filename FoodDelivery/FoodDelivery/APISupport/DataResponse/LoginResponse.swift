//
//  BaseResponse.swift
//  FoodDelivery
//
//  Created by Trinh Thai on 10/8/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import Foundation
import ObjectMapper

class LoginResponse: Mappable {
    var msg: String?
    var token: String?
    var id: Int?

    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        msg <- map["msg"]
        token <- map["token"]
        id <- map["id"]
    }
}



