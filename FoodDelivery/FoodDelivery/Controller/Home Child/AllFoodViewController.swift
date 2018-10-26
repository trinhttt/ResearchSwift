//
//  AllFoodViewController.swift
//  FoodDelivery
//
//  Created by Thai Thi Tu Trinh on 10/26/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit

class AllFoodViewController: UIViewController {
  var presenter : FoodPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter = FoodPresenter()
        self.presenter.delegate = self
    }
    @IBAction func getFoodList(_ sender: Any) {
        self.presenter.getAllFood("")
    }

}
extension AllFoodViewController: FoodProtocol{
    func getAllFoodSuccessful(isSuccessful: Bool) {
        if isSuccessful{
            print("ok")
        }else{
            Common.displayAlert(info: "Lấy danh sách food thất bại",view:self)
        }
    }
    
    
}
