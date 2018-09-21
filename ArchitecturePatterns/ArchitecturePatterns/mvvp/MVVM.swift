//
//  MVVP.swift
//  ArchitecturePatterns
//
//  Created by Thai Thi Tu Trinh on 9/19/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//


/*MVVM coi view controller như là View
 View và Model không ràng buộc chặt với nhau
 - View owns VM
 - VM owns&update Model
 */

import Foundation

struct Teacher{//Model
    var id:Int
}
protocol TeacherViewMoldelProtocol {
    func isTeacher(_ id : Int)
    init(teacher: Teacher)
}

class TeacherViewMoldel: TeacherViewMoldelProtocol{
    let teacher : Teacher
    
    func isTeacher(_ id : Int) {
        if id > 1100000 {
            print("This is a teacher")
        }else{
            print("This is not a teacher")
        }
    }
    
    required init(teacher: Teacher) {
        self.teacher = teacher
    }
}
