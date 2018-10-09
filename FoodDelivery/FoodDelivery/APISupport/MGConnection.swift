//
//  MGConnection.swift
//  FoodDelivery
//
//  Created by Trinh Thai on 10/8/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class MGConnection {
    
    static func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    static func request(_ apiRouter: APIRouter, completion: @escaping (_ result: Any?, _ error: ErrorResponse?) -> Void) {
        if !isConnectedToInternet() {
            print("Cant't connect internet!")// Xử lý khi lỗi kết nối internet
            
            return
        }
        
        Alamofire.request(apiRouter).responseObject{(response: DataResponse<CommonResponse>) in//AlamofireObjectMapper
            switch response.result {
            case .success:
                print(response.result)
                print(response.result.value)
                print(response.response?.statusCode)

                if response.response?.statusCode == 200 {
                    // print(response.result.value?.msg as Any)
                    
                    completion((response.result.value), nil)
                } else {
                    let err: ErrorResponse = ErrorResponse.init(NetworkErrorType.HTTP_ERROR, (response.response?.statusCode)!, "Request is error!")
                    completion(nil, err)
                }
                break
                
            case .failure(let error):
                if error is AFError {
                    let err: ErrorResponse = ErrorResponse.init(NetworkErrorType.HTTP_ERROR, error._code, "Request is error!")
                    completion(nil, err)
                }
                
                break
            }
        }
    }
}
