//
//  LoginPresenter.swift
//  FoodDelivery
//
//  Created by Thai Thi Tu Trinh on 10/9/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import Foundation


protocol LoginProtocol {
    func loginSuccessful(state: Bool)
}

class LoginPresenter {
    var delegate: LoginProtocol!
    func Login() {
        MGConnection.request(APIRouter.login(email: "trinh.ttt@aris-vn.com", password: "123456"), LoginResponse.self,
                             completion: {(result, err) in
                                guard err == nil else {
                                    print("False with code: \(err?.mErrorCode) and message: \(err?.mErrorMessage)")
                                    return
                                }

                                //print(result)

                                self.delegate.loginSuccessful(state: true)

        })
        
    }
}
