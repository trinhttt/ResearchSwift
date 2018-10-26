//
//  APIRouter.swift
//  FoodDelivery
//
//  Created by Thai Thi Tu Trinh on 10/8/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible{    //ke thua tu protocol
    
    func asURLRequest() throws -> URLRequest {
        let url = try Production.BASE_URL.asURL()
        var urlRequest: URLRequest = URLRequest(url: url.appendingPathComponent(path))// setting path
        urlRequest.httpMethod = method.rawValue//setting method
        
        for (key, value) in headers {
            urlRequest.addValue(value, forHTTPHeaderField: key)// setting header
        }
        
        if let parameters = parameters {
            do {
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
                print(urlRequest)

            } catch {
                print("Encoding fail")
            }
        }
        return urlRequest
    }
    
    private func getAuthorizationHeader() -> String? {
        return "Authorization token"
    }
    
    // MARK: - define api
    
    //Action
    case login(email: String, password: String)
    case register(email: String, password: String)
    case getAllFood(foodname: String)
    case getRestaurantMenu(id: Int)
    //Method
    private var method: HTTPMethod {
        switch self {
        case .login, .register:
            return .post
        case .getAllFood:
            return .get
        case .getRestaurantMenu:
            return .get
        }
    }
    
    //Path
    private var path: String {
        switch self {
        case .login:
            return "login"
        case .register:
            return "register"
        case .getAllFood:
            return "food/searchfood"
        case .getRestaurantMenu:
            return "restaurant/getMenu/:id"
        }
    }
    
    //Header
    private var headers: HTTPHeaders {
        let headers = ["Accept": "application/json"]
        switch self {
        case .login:
            break
        case .register:
            break
        case .getAllFood:
            break
        case .getRestaurantMenu:
            break
        }
        
        return headers
        
    }
    
    //Param
    private var parameters: Parameters? {
        switch self {
        case .login(let email, let password):
            return [
                "email": email,
                "password": password
            ]
        case .register(let email, let password):
            return [
                "email": email,
                "password": password
            ]
        case .getAllFood(let foodname):
            return [
                "foodname": foodname
            ]
        case .getRestaurantMenu(let id):
            return [
                "id": id
            ]
        }
    }
}
