//
//  ViewController.swift
//  3WaysConnectDataBetweenModelAndControllerMVC
//
//  Created by Thai Thi Tu Trinh on 10/3/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let dataModel1 = DataModel1()
    let dataModel2 = DataModel2()
    let dataModel3 = DataModel3()

    override func viewDidLoad() {
        super.viewDidLoad()
        dataModel1.requestData{(output: String) in
            self.printData(data: output)
        }
        dataModel2.dataUpdate = {(output: String) in
            self.printData(data: output)
        }
        dataModel2.requestData()
        
        dataModel3.delegate = self
        dataModel3.requestData()
    }
    
    func printData(data: String){
        print(data)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: DataModelDelegate {
    func printData3(_ data: String) {
        print(data)
    }
    
   
}

