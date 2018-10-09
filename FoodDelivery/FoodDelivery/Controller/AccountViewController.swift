//
//  AccountViewController.swift
//  FoodDelivery
//
//  Created by Thai Thi Tu Trinh on 10/9/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet var ibUsername: UITextField!
    @IBOutlet var ibPassword: UITextField!
    var presenter: LoginPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("aa")

        presenter = LoginPresenter()
        presenter.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        print("aa")

        presenter.Login()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func ibLoginAction(sender: AnyObject) {
       
    }
    
    @IBAction func ibRegisterAction(sender: AnyObject) {
    }
    
    
}
extension AccountViewController: LoginProtocol{
    
    func loginSuccessful(state: Bool) {
        if state == true {
            print("Login successfully2")
        }
    }
}
