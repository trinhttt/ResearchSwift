//
//  TabBarBaseViewController.swift
//  Location
//
//  Created by Thai Thi Tu Trinh on 9/26/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit

class TabBarBaseViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var fontSize = 12.0
        if UIDevice.current.userInterfaceIdiom == .pad{
            fontSize = 14.0
        }
        let appearence = UITabBarItem.appearance()
        appearence.setTitleTextAttributes([NSAttributedStringKey.font: UIFont(name: "Arial", size: CGFloat(fontSize))!, NSAttributedStringKey.foregroundColor: UIColor.lightGray], for: UIControlState.normal)
        appearence.setTitleTextAttributes([NSAttributedStringKey.font: UIFont(name: "Arial", size: CGFloat(fontSize))!, NSAttributedStringKey.foregroundColor: UIColor.orange], for: UIControlState.selected)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
