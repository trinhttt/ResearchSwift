//
//  CompletionHandle.swift
//  3WaysConnectDataBetweenModelAndControllerMVC
//
//  Created by Thai Thi Tu Trinh on 10/3/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import Foundation
class DataModel1{
    
    //1.1 callback use comletion handle
    func requestData(completion: ((_ outputData: String) -> Void)){
        let num1 = 1.2
        if num1 == 1{
            completion("=")
        }else{
            completion("!=")
        }
    }
}

class DataModel2{
    
    //1.2 callback use class property
    var dataUpdate: ((_ outputData: String)->Void)
    init() {
        self.dataUpdate = {(output:String) in }
    }
    func requestData(){
        dataUpdate("bla bla")
        
    }
}

//other example : design completion handle
class DataModelOtherExample{
    
    //normal
    var dataUpdate: ((_ outputData: String)->Void) = { data in
        print(data)
    }
    
    // use $0 to make it shorter
    var dataUpdate1: ((_ outputData: String)->Void) = {
        print($0)
    }
    
    func requestData(){
        dataUpdate("bla bla 1")
        dataUpdate1("bla bla 2")
    }
}


