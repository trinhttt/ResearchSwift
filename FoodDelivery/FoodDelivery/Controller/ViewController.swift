//
//  ViewController.swift
//  FoodDelivery
//
//  Created by Thai Thi Tu Trinh on 10/8/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    var presenter: LoginPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LoginPresenter()
        presenter.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.Login()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

extension ViewController: LoginProtocol{
    
    func loginSuccessful(state: Bool) {
        if state == true {
            print("Login successfully1")
        }
    }
}
