//
//  Trategy.swift
//  DesignPattern
//
//  Created by Thai Thi Tu Trinh on 9/19/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import Foundation
/*
Cho phép bạn thay đổi hành vi của thuật toán trong thời gian chạy.
Xác định một nhóm thuật toán, đóng gói từng thuật toán và làm cho chúng có thể hoán đổi cho nhau, cho phép chọn thuật toán nào để thực thi tại 1 thời gian chạy nào đó.
 */
protocol PerSonType{
    func getStudent()
}
class Student_Strategy{
    private var type : PerSonType?
    
    func setStudentType(type: PerSonType){
        self.type = type
        type.getStudent()

    }
    
}

class Student: PerSonType {
    func getStudent(){
        print("student")
    }
}

class Others: PerSonType {
    func getStudent(){
        print("is not student")
    }
}
