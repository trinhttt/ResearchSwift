//
//  Proxy.swift
//  DesignPattern
//
//  Created by Thai Thi Tu Trinh on 9/19/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import Foundation
/*
 Proxy Pattern là mẫu thiết kế mà ở đó tất cả các truy cập trực tiếp một đối tượng nào đó sẽ được chuyển hướng vào một đối tượng trung gian (Proxy Class).
 Proxy Pattern có nhiệm vụ bảo vệ việc truy cập một đối tượng thông qua Proxy, hay còn gọi là truy cập gián tiếp.
 *///soldier

protocol Character {
    func fight()
}

class Boss: Character {
    func fight() {
        print("Boss assign for")
    }
}

//proxy
class Soldier: Character {
    var character : Character
    init(character: Character) {
        self.character = character
    }
    func fight() {
        character.fight()
         print("soldier fights")
    }
}
