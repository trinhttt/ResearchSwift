//
//  MVVP.swift
//  ArchitecturePatterns
//
//  Created by Thai Thi Tu Trinh on 9/19/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import Foundation

struct Student{
    var id : Int
}

protocol StudentViewPresenter {
    func isStudent(state: Bool)
}

class StudentPresenter{
    var delegate : StudentViewPresenter!
    
    func showInfo(_ id : Int) {
        if id > 1100000 {
           self.delegate.isStudent(state: true)
        }else{
            self.delegate.isStudent(state: false)
        }
    }
    
    
}


