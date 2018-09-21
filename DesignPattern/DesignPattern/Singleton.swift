//
//  Singleton.swift
//  DesignPattern
//
//  Created by Thai Thi Tu Trinh on 9/19/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import Foundation
/*
 Class bt moi lan su dung func phai khoi tao lai class. => Dung static instance
 */



class StudentSingleton{
    private static let shared = StudentSingleton()
    
    var isStudent : Bool!
    private init(){
    }
    
    static func createInstance() -> StudentSingleton {
        return shared
    }
    
    
    func getStudent(_ currentID: Int)->Bool{
        if currentID > 1100000 && currentID < 1800000{
            isStudent = true
        }
        else{
            isStudent = false
        }
        return isStudent
    }
    
}


