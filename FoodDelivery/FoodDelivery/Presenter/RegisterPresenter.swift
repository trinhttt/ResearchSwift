//
//  RegisterPresenter.swift
//  FoodDelivery
//
//  Created by Thai Thi Tu Trinh on 10/9/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import Foundation
protocol RegisterProtocol {
    func loginSuccessful(isSuccessful: Bool)
}

class RegisterPresenter {
    var delegate: RegisterProtocol!
    func Register(_ emailParam: String,_ passwordParam: String) {
        MGConnection.request(APIRouter.register(email: emailParam, password: passwordParam), RegisterResponse.self,
                             completion: {(result, err) in
                                guard err == nil else {
                                    print("False with code: \(err?.mErrorCode) and message: \(err?.mErrorMessage)")
                                    self.delegate.loginSuccessful(isSuccessful: false)
                                    return
                                }
                                
                                self.delegate.loginSuccessful(isSuccessful: true)
                                
        })
        
    }
}
