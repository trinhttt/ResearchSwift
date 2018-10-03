//
//  DelegateUsing.swift
//  3WaysConnectDataBetweenModelAndControllerMVC
//
//  Created by Thai Thi Tu Trinh on 10/3/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import Foundation

protocol DataModelDelegate{
    func printData3(_ data: String)
}

class DataModel3{
    var delegate:DataModelDelegate!
    func requestData(){
        let data = "4t"
        delegate.printData3(data)
    }
}


