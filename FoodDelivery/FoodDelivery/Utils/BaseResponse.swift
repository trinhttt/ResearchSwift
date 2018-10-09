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
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        msg <- map["msg"]
        token <- map["token"]
    }
}


class LoginResponseError {
    var mErrorType: NetworkErrorType!
    var mErrorCode: Int!
    var mErrorMessage: String!
    
    init(_ errorType: NetworkErrorType,_ errorCode: Int,_ errorMessage: String) {
        mErrorType = errorType
        mErrorCode = errorCode
        mErrorMessage = errorMessage
    }
}
