//
//  RegisterViewController.swift
//  FoodDelivery
//
//  Created by Thai Thi Tu Trinh on 10/9/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var ibEmail: UITextField!
    @IBOutlet weak var ibPassword: UITextField!
    @IBOutlet weak var ibConfirmPassword: UITextField!
    var presenter: RegisterPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = RegisterPresenter()
        presenter.delegate = self
        ibEmail.autocorrectionType = .no
        ibPassword.autocorrectionType = .no
        ibConfirmPassword.autocorrectionType = .no
        ibPassword.isSecureTextEntry = true
        ibConfirmPassword.isSecureTextEntry = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func ibRegisterAction(_ sender: Any) {
        guard ibEmail.text != "", ibPassword.text != "", ibConfirmPassword.text != "" else {
            Common.displayAlert(info: "Vui lòng nhập đầy đủ thông tin!",view:self)
            return
        }
        guard ibPassword.text == ibConfirmPassword.text else {
            Common.displayAlert(info: "Nhập lại mật khẩu không khớp!",view:self)
            return
        }
        presenter.userRegister(ibEmail.text!, ibPassword.text!)
    }
}

extension RegisterViewController: RegisterProtocol{
    
    func registerSuccessful(isSuccessful: Bool) {
        if isSuccessful {
            Common.displayAlert(info: "Đăng ký thành công!",view:self)
        }else{
            Common.displayAlert(info: "Email sai định dạng hoặc đã đăng ký trước đó!",view:self)
        }
    }
}
