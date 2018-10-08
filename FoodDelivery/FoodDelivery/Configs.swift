//
//  Configs.swift
//  FoodDelivery
//
//  Created by Thai Thi Tu Trinh on 10/8/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import Foundation

struct Production {
    static let BASE_URL: String = "https://food-delivery-server.herokuapp.com"
}


enum NetworkErrorType{ // phan biet loi
    case API_ERROR // loi do server tra ve
    case HTTP_ERROR //loi do goi den API
}
