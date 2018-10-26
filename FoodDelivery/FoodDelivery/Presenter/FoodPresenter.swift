//
//  FoodPresenter.swift
//  FoodDelivery
//
//  Created by Thai Thi Tu Trinh on 10/26/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import Foundation
protocol FoodProtocol {
    func getAllFoodSuccessful(isSuccessful: Bool)
}

class FoodPresenter {
    var delegate: FoodProtocol!
    func getAllFood(_ foodname: String) {
        MGConnection.request(APIRouter.getAllFood(foodname: foodname)) {(result, err) in
                                
                                guard err == nil else {
                                    print("False with code: \(String(describing: err?.mErrorCode)) and message: \(String(describing: err?.mErrorMessage))")
                                    self.delegate.getAllFoodSuccessful(isSuccessful: false)
                                    return
                                }
                                
                                print(result as Any)
                                self.delegate.getAllFoodSuccessful(isSuccessful: true)
                                
        }
        
    }
}
