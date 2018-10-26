//
//  Extension.swift
//  FoodDelivery
//
//  Created by Thai Thi Tu Trinh on 10/26/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import Foundation
import UIKit
extension UISegmentedControl{
    func setupHomeSegment(){
        self.setTitleTextAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15), NSAttributedStringKey.foregroundColor: UIColor.darkGray], for: .normal)
        self.setTitleTextAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15), NSAttributedStringKey.foregroundColor: UIColor.white], for: .selected)
        self.setBackgroundImage(UIColor.lightGray.createImage(), for: .normal, barMetrics: .default)
        self.setBackgroundImage(UIColor.orange.createImage(), for: .selected, barMetrics: .default)
        self.setDividerImage(UIColor.orange.createImage(), forLeftSegmentState: .selected, rightSegmentState: .selected, barMetrics: .default)
    }
}
extension UIColor{
    func createImage()-> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width:  1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(self.cgColor);
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }
}
