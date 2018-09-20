//
//  KeyWords.swift
//  useKeyWords
//
//  Created by Thai Thi Tu Trinh on 9/20/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import Foundation

// associatedtype: khai bao trong 1 protocol, thay cho 1 kdl bat ky. KDL duoc dat lai khi protocol do dc adopt
protocol Student1{
    associatedtype StudentType
}
class Student2: Student1{
    typealias StudentType = Int
}


class TestKeyWord{
    
    //open: access control cho phep object dc use ngoai module khac (thuong dung tao framework)
    open var b = ""
    
    //internal: access control dc su dung trong 1 module, k ghi thi mac dinh la internal
    internal var a = "" // ~ var a = ""
    
    //defer: dam bao thuc thi 1 doan code nao do NGAY KHI ham ket thuc
    static func DeferTest(){
        defer{
            print("in t ngay khi xu ly xong ham")
        }
        print("xu ly abc")
    }
    
    //inout: thay doi gia tri khi ra khoi ham
    static func Swap( a:inout Int, b:inout Int){
        let temp = a
        a = b
        b = temp
    }
}

// Self: Xai trong protocol, duoc xac nhan lai trong class/struct/enum su dung protocol
protocol SelfProtocol {
    func printSth(other: Self)
}
class UseSelf: SelfProtocol {
    func printSth(other: UseSelf) {
        print("abc")
    }
}

func useKeyWord(){
    var a = 10
    var b = 20
    TestKeyWord.Swap(a: &a, b: &b)
    print("a = \(a), b = \(b)")

    TestKeyWord.DeferTest()
    
    //repeat: Giong do-while trong C, thuc thi ctr 1 lan truoc khi xet dieu kien
    var index_Repeat = 0
    repeat{
        print(index_Repeat)
        index_Repeat += 1
    }while index_Repeat < 2
    
    //Any: dai dien cho all doi tuong ( int, string, func)
    var any = [Any]()
    any.append("String")
    any.append(0)
    any.append(TestKeyWord.DeferTest())
    
    //fallthrough : use trong switch-case, xet tu tren xuong, neu dung 1 case nao do se xet tiep case lien ke
    let test_fallthrough = 0
    switch test_fallthrough{
    case 0:
        print("0")
        fallthrough
    case 1:
        print("1")
        fallthrough
    default:
        print("done")
    }
    
    
    
}
