//
//  HomeViewController.swift
//  FoodDelivery
//
//  Created by Thai Thi Tu Trinh on 10/26/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var ibChooseViewDisplay: UISegmentedControl!
  
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.ibChooseViewDisplay.setupHomeSegment()
        
    }

    @IBAction func changeTypeDisplay(_ sender: Any) {
        switch ibChooseViewDisplay.selectedSegmentIndex {
        case 0:
            self.view.viewWithTag(132000)?.isHidden = false
            self.view.viewWithTag(132001)?.isHidden = true
            self.view.viewWithTag(132002)?.isHidden = true
        case 1:
            self.view.viewWithTag(132001)?.isHidden = false
            self.view.viewWithTag(132000)?.isHidden = true
            self.view.viewWithTag(132002)?.isHidden = true
        case 2:
            self.view.viewWithTag(132002)?.isHidden = false
            self.view.viewWithTag(132000)?.isHidden = true
            self.view.viewWithTag(132001)?.isHidden = true
        default:
            break
        }
    }
    

}


