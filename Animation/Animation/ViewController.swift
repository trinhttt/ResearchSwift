//
//  ViewController.swift
//  Animation
//
//  Created by Thai Thi Tu Trinh on 9/20/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ibTitle: UILabel!
    @IBOutlet weak var ibUserName: UITextField!
    @IBOutlet weak var ibPassword: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.ibTitle.center.x -= self.view.bounds.width
        self.ibUserName.center.x -= self.view.bounds.width
        self.ibPassword.center.x -= self.view.bounds.width
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1){
            self.ibTitle.center.x += self.view.bounds.width
        }
        UIView.animate(withDuration: 1, delay: 0.4, options: [], animations: {
            self.ibUserName.center.x += self.view.bounds.width
            }, completion: nil)
        UIView.animate(withDuration: 1, delay: 0.8, options: [.repeat,.autoreverse, .curveEaseOut], animations: {
            self.ibPassword.center.x += self.view.bounds.width*2
        }, completion: nil)
        

        
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

