//
//  RestaurantViewController.swift
//  FoodDelivery
//
//  Created by Thai Thi Tu Trinh on 10/26/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit

class RestaurantViewController: UIViewController {
var presenter : RestaurantPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = RestaurantPresenter()
        self.presenter.delegate = self
    }
    
    @IBAction func getRestaurantInfo(_ sender: Any) {
        self.presenter.getRestaurantInfo(1)
    }
}
extension RestaurantViewController: RestaurantProtocol{
    func getRestaurantInfoSuccessful(isSuccessful: Bool) {
        if isSuccessful{
            print("ok")
        }else{
            Common.displayAlert(info: "Lấy danh sách food thất bại",view:self)
        }
    }
    
    
}
