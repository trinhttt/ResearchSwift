//
//  FuncClass.swift
//  SmartFriend_Realm
//
//  Created by Thai Thi Tu Trinh on 8/15/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import Foundation
import Alamofire
import Reachability
var data_display : Restaurent?

//kiem tra ket noi mang

////hien thi load data = code
extension UIViewController {
    class func displaySpinner(onView : UIView) -> UIView {
//        let spinnerView = UIView.init(frame: onView.bounds)
        let rect = CGRect(x: onView.bounds.size.width/2, y: onView.bounds.size.height/2, width: 100, height: 100)
        let spinnerView = UIView(frame: rect)

        spinnerView.backgroundColor = UIColor.init(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.2)
//        spinnerView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0)
        let ai = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center

        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }

        return spinnerView
    }

    class func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
}
//API
class RequestData {
    static var shared = RequestData()

    //Check Internet Connection
    func CheckConect(viewController:UIViewController){
        let reachability = Reachability()!
        
        reachability.whenReachable = { reachability in
            if reachability.connection == .wifi {
                print("Reachable via WiFi")
            } else {
                print("Reachable via Cellular")
            }
        }
        
        reachability.whenUnreachable = { reachability in
            let alertController = UIAlertController(title: "No Internet Connection", message: "Make sure your device is connected to the internet", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            
            viewController.present(alertController, animated: true, completion: nil)
        }
        
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    
    // Request Data
    func EXE(ibTableView:UITableView, view:UIView){
        
        let sv = UIViewController.displaySpinner(onView:view)
//        ActivityIndicator.isHidden=true
//        ActivityIndicator.startAnimating()
        Alamofire.request("http://52.91.63.113:8080/RestaurantKiosk/ItemUtils", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            switch response.result {
            case .success:
                if let data = response.data {
                    let root = try! JSONDecoder().decode(Restaurent.self, from: data)
                    data_display = root
                    UIViewController.removeSpinner(spinner: sv)
//                    if (ActivityIndicator.isAnimating == true){
//                        ActivityIndicator.isHidden=false
//                        ActivityIndicator.stopAnimating()
//                    }
                    ibTableView.reloadData()

                    
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
}
