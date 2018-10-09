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
    
    static func request<T: Mappable>(_ apiRouter: APIRouter,_ returnType: T.Type, completion: @escaping (_ result: String?, _ error: LoginResponseError?) -> Void) {
        if !isConnectedToInternet() {
            print("Cant't connect internet!")// Xử lý khi lỗi kết nối internet

            return
        }
        
        Alamofire.request(apiRouter).responseObject{(response: DataResponse<LoginResponse>) in
            switch response.result {
            case .success:
                if response.response?.statusCode == 200 {
                   // print(response.result.value?.msg as Any)
                    //print(response.result.value?.token as Any)

                    completion((response.result.value?.msg ), nil)
                } else {
                    let err: LoginResponseError = LoginResponseError.init(NetworkErrorType.HTTP_ERROR, (response.response?.statusCode)!, "Request is error!")
                    completion(nil, err)
                }
                break
                
            case .failure(let error):
                if error is AFError {
                    let err: LoginResponseError = LoginResponseError.init(NetworkErrorType.HTTP_ERROR, error._code, "Request is error!")
                    completion(nil, err)
                }
                
                break
            }
        }
    }
}
