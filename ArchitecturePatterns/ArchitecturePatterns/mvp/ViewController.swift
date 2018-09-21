//
//  ViewController.swift
//  ArchitecturePatterns
//
//  Created by Thai Thi Tu Trinh on 9/19/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var presenter:StudentPresenter!
    var id : Int = 1200000
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = StudentPresenter()
        presenter.delegate = self
        presenter.showInfo(id)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: StudentViewPresenter {
    func isStudent(state: Bool) {
        if state == true {
            print("This is a student")
        }else{
            print("This is not a student")
        }
    }
}

