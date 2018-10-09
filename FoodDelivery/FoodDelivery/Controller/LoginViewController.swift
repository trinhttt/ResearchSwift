//
//  AccountViewController.swift
//  FoodDelivery
//
//  Created by Thai Thi Tu Trinh on 10/9/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var ibEmail : UITextField!
    @IBOutlet var ibPassword: UITextField!
    var presenter: LoginPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LoginPresenter()
        presenter.delegate = self
        ibEmail.autocorrectionType = .no
        ibPassword.autocorrectionType = .no
        ibPassword.isSecureTextEntry = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func ibLoginAction(sender: AnyObject) {
        guard ibEmail.text != "", ibPassword.text != "" else {
            Common.displayAlert(info: "Vui lòng nhập đầy đủ thông tin!",view:self)
            return
        }
        presenter.Login(ibEmail.text!, ibPassword.text!)

    }
    
    @IBAction func ibRegisterAction(sender: AnyObject) {
    }

    
}
extension LoginViewController: LoginProtocol{
    
    func loginSuccessful(isSuccessful: Bool) {
        if isSuccessful {
            Common.displayAlert(info: "Đăng nhập thành công",view:self)
        }else{
            Common.displayAlert(info: "Email hoặc mật khẩu sai!",view:self)
        }
  }
}
