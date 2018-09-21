//
//  CustomDialogViewController.swift
//  Sale
//
//  Created by Thai Thi Tu Trinh on 8/30/18.
//  Copyright © 2018 Trinh Thai. All rights reserved.
//

import UIKit
import PopupDialog

class CustomDialogViewController: UIViewController {
    var selectedItem = -1
    var selectedRice = -1
    var tagProduct = -1
    @IBOutlet weak var ibCustomProductImage: UIImageView!
    
    @IBOutlet weak var ibCustomProductName: UILabel!
    
    @IBOutlet weak var ibCustomProductPrice: UILabel!
    
    @IBOutlet weak var ibKgCount: UILabel!
    
    @IBOutlet weak var ibIncreaseButton: UIButton!
    
    @IBOutlet weak var ibDecreaseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ibIncreaseButton.layer.cornerRadius =  ibIncreaseButton.frame.size.width / 2.7
        ibIncreaseButton.layer.masksToBounds = true

        ibDecreaseButton.clipsToBounds = true
        ibDecreaseButton.layer.cornerRadius =  ibDecreaseButton.bounds.size.width/2.7
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func update(countKg: Int,  price: Int ) {
        ibKgCount.text = String(countKg) + " Kg"
        ibCustomProductPrice.text = SaleProvider.formatNumber(value: Double(price)) + " đ"
    }
    @objc func IncreaseTapped(_ button: UIButton) {
        let Transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        UIView.animate(withDuration: 0.05, animations: {
            self.ibIncreaseButton.transform = Transform
        },
                       completion:
            {_ in
                self.ibIncreaseButton.transform = CGAffineTransform.identity
        })
        
        CountKg = CountKg + 1
        if selectedRice == 1{
            tempPrice = (displayData?.data.category[tagProduct].products[selectedItem].price_calded)! * CountKg
        }
        if selectedRice == 0{
            tempPrice = (displayData?.data.category[tagProduct].products[selectedItem].price_calded)! * CountKg
        }
        print("\(CountKg) - \(tempPrice)")
        customView.update(countKg: CountKg, price: tempPrice)
        
    }
    
    @objc func DecreaseTapped(_ button: UIButton) {
        
        let Transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        UIView.animate(withDuration: 0.05, animations: {
            self.ibDecreaseButton.transform = Transform
        },
                       completion:
            {_ in
                self.ibDecreaseButton.transform = CGAffineTransform.identity
        })
        
        if CountKg > 1{
            CountKg = CountKg - 1
        }
        if selectedRice == 1{
            tempPrice = (displayData?.data.category[tagProduct].products[selectedItem].price_calded)! * CountKg
        }
        if selectedRice == 0{
            tempPrice = (displayData?.data.category[tagProduct].products[selectedItem].price_calded)! * CountKg
        }
        print("\(CountKg) - \(tempPrice)")
        self.update(countKg: CountKg, price: tempPrice)
        
    }
    
    func showCustomDialog(animated: Bool = true, _ index:Int, _ product: Int, _ tag: Int){
        CountKg = 1
        selectedItem = index
        tagProduct = tag
        selectedRice = product
        let popup = PopupDialog(viewController: customView,
                                buttonAlignment: .horizontal,
                                transitionStyle: .bounceDown,
                                preferredWidth: CGFloat(340),
                                tapGestureDismissal: true,
                                panGestureDismissal: true)
        if product == 0{ // khong chon gao
            let item = displayData?.data.category[tag].products[index]
            let url = URL(string: String((item?.image)!))
            
            ibCustomProductImage.kf.setImage(with: url)
            ibKgCount.text = "1 Kg"
            ibCustomProductPrice.text = String((SaleProvider.formatNumber(value: Double((item?.price_calded)!)))) + "đ"
            ibCustomProductName.text = (item?.title)!
        } else {
            if product == 1{
                let item = displayData?.data.category[tag].products[index]
                ibKgCount.text = "1 Kg"
                ibCustomProductPrice.text = String((SaleProvider.formatNumber(value: Double((item?.price_calded)!)))) + "đ"
                ibCustomProductName.text = (item?.title)!
            }
        }
        
        
        ibIncreaseButton.addTarget(self, action: #selector(IncreaseTapped(_:)), for: .touchUpInside)
        ibDecreaseButton.addTarget(self, action: #selector(DecreaseTapped(_:)), for: .touchUpInside)
        let buttonOne = CancelButton(title: "CANCEL", height: 60) {
            print("Click Cancel")
        }
        let buttonTwo = DefaultButton(title: "OK", height: 60) {
            print("Click OK")
        }
        popup.addButtons([buttonOne, buttonTwo])
        UIApplication.shared.keyWindow?.rootViewController?.present(popup, animated: true, completion: nil)
        //        present(popup, animated: animated, completion: nil)
    }

    
}
