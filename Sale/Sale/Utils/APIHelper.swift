//
//  APIHelper.swift
//  Sale
//
//  Created by Thai Thi Tu Trinh on 8/24/18.
//  Copyright © 2018 Trinh Thai. All rights reserved.
//

import Foundation
import Alamofire

class RequestData {
    private static var shared = RequestData()
    private init(){
    }
    static func getInatance()->RequestData{
        return shared
    }
    
    
    func request(completion: @escaping (Bool, Any?, Error?) -> Void){
        Alamofire.request("http://192.168.1.218:81/api/home_api", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result {
            case .success:
                if let data = response.data {
                    let root = try! JSONDecoder().decode(managerData.self, from: data)
                    completion(true, root, nil)
                }
            case .failure(let error):
                print(error)
                completion(false, nil, error)
            }
        }
        
    }
}

