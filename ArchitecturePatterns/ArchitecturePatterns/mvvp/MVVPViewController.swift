//
//  MVVPViewController.swift
//  ArchitecturePatterns
//
//  Created by Thai Thi Tu Trinh on 9/19/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit

class MVVPViewController: UIViewController {
    var id : Int = 1200000

    var viewModel:TeacherViewMoldelProtocol!{
        didSet{
            self.viewModel.isTeacher(id)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

