//
//  Composite.swift
//  DesignPattern
//
//  Created by Thai Thi Tu Trinh on 9/19/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import Foundation
/*
  một đối tượng composite được tạo thành từ một hay nhiều đối tượng tương tự nhau (hoặc có một số chức năng tương tự nhau).
 Ý tưởng : có thể thao tác trên một nhóm đối tượng theo cách như thao tác trên một đối tượng duy nhất. Các đối tượng của nhóm phải có các thao tác chung, hay còn gọi là mẫu số chung nhỏ nhất.
 */

//Component: base class cho toàn bộ các đối tượng (khai bao doi tuong va cac thao tac mac dinh)
protocol StudentComponent{
    var idStudent: Int { get }//1
    func getStudent()//2
}

//Leaf class - là các bước không thể phân chia được nữa
class StudentLeaf : StudentComponent{
    
    private var _idStudent : Int = 1512601

    var idStudent: Int{//1
        return _idStudent
    }
    
    init(idStudent : Int) {
        self._idStudent = idStudent
    }
    
    func getStudent(){//2
        if idStudent > 1100000 && idStudent < 1800000{
            print("get \(idStudent) successfully")
        }
        else{
            print("get \(idStudent) failly")
        }
    }
    

}

//cần ít nhất một class ở mức cao hơn, gọi là composite class, quan ly cac leaf
// Dinh nghia thao tac cho Component co' leaf + luu tru & quan ly leaf (Co the them cac method khac: add)
class StudentComposite : StudentComponent{
    private var _idStudent : Int = 1512601
    
    var idStudent: Int{//1
        return _idStudent
    }
    private var students = [StudentComponent]()
    
    init(people: [StudentComponent] = []) {
        self._idStudent = idStudent
        self.students = people
    }
    
    func getStudent(){//2
        for student in students{
            student.getStudent()
        }
    }
    
}
