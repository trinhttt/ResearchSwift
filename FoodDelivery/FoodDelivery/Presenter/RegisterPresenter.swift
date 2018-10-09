//
//  RegisterPresenter.swift
//  FoodDelivery
//
//  Created by Thai Thi Tu Trinh on 10/9/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import Foundation
protocol RegisterProtocol {
    func registerSuccessful(isSuccessful: Bool)
}

class RegisterPresenter {
    var delegate: RegisterProtocol!
    func Register(_ emailParam: String,_ passwordParam: String) {
        MGConnection.request(APIRouter.register(email: emailParam, password: passwordParam),
                             completion: {(result, err) in
                                guard err == nil else {
                                    print("False with code: \(String(describing: err?.mErrorCode)) and message: \(String(describing: err?.mErrorMessage))")
                                    self.delegate.registerSuccessful(isSuccessful: false)
                                    return
                                }
                                print(result as Any)
                                self.delegate.registerSuccessful(isSuccessful: true)
                                
        })
        
    }
}
