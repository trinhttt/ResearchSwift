//
//  ViewController.swift
//  DesignPattern
//
//  Created by Thai Thi Tu Trinh on 9/19/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Singleton
        let ID = 1512601
        if StudentSingleton.createInstance().getStudent(ID){
             print("get a student successfully")
        }
        
        //Composite
        let person1 = StudentLeaf(idStudent: 1512000)
        let person2 = StudentLeaf(idStudent: 512601)
        let person3 = StudentLeaf(idStudent: 1512601)
        let arrStudent = StudentComposite(people: [person1, person2])
        let allStudent = StudentComposite(people: [person3, arrStudent])//tree all composite co leaf(person3) & arrStudent composite([person1,person2])
        allStudent.getStudent()
        
        //Strategy
        let person4 = Student_Strategy()
        person4.setStudentType(type: Student())
        person4.setStudentType(type: Others())
        
        //Proxy
        let boss = Boss()
        let soldier = Soldier(character: boss)
        soldier.fight()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

