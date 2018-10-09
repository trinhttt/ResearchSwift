//
//  ErrorResponse.swift
//  FoodDelivery
//
//  Created by Thai Thi Tu Trinh on 10/9/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import Foundation

class ErrorResponse {
    var mErrorType: NetworkErrorType!
    var mErrorCode: Int!
    var mErrorMessage: String!
    
    init(_ errorType: NetworkErrorType,_ errorCode: Int,_ errorMessage: String) {
        mErrorType = errorType
        mErrorCode = errorCode
        mErrorMessage = errorMessage
    }
}
