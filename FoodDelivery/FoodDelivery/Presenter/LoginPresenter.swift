//
//  LoginPresenter.swift
//  FoodDelivery
//
//  Created by Thai Thi Tu Trinh on 10/9/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import Foundation

//"trinh.ttt@aris-vn.com"
//"123456"
protocol LoginProtocol {
    func loginSuccessful(isSuccessful: Bool)
}

class LoginPresenter {
    var delegate: LoginProtocol!
    func Login(_ emailParam: String,_ passwordParam: String) {
        MGConnection.request(APIRouter.login(email: emailParam, password: passwordParam), LoginResponse.self,
                             completion: {(result, err) in
                                guard err == nil else {
                                    print("False with code: \(err?.mErrorCode) and message: \(err?.mErrorMessage)")
                                    self.delegate.loginSuccessful(isSuccessful: false)
                                    return
                                }
                                
                                //print(result)
                                
                                self.delegate.loginSuccessful(isSuccessful: true)
                                
        })
        
    }
}
