//
//  RestaurantPresenter.swift
//  FoodDelivery
//
//  Created by Thai Thi Tu Trinh on 10/26/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import Foundation
protocol RestaurantProtocol {
    func getRestaurantInfoSuccessful(isSuccessful: Bool)
}

class RestaurantPresenter {
    var delegate: RestaurantProtocol!
    func getRestaurantInfo(_ id: Int) {
        MGConnection.request(APIRouter.getRestaurantMenu(id:id),
                             completion: {(result, err) in
                                
                                guard err == nil else {
                                    print("False with code: \(String(describing: err?.mErrorCode)) and message: \(String(describing: err?.mErrorMessage))")
                                    self.delegate.getRestaurantInfoSuccessful(isSuccessful: false)
                                    return
                                }
                                
                                print(result as Any)
                                self.delegate.getRestaurantInfoSuccessful(isSuccessful: true)
                                
        })
        
    }
}
