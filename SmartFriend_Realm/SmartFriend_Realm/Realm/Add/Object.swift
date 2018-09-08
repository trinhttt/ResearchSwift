//
//  ActivityObject.swift
//  SmartFriend_Realm
//
//  Created by Thai Thi Tu Trinh on 8/13/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

class Activity: Object{

    @objc dynamic var img = ""
    @objc dynamic var note = ""
    @objc dynamic var name = ""
}

class Activities:Object{
    @objc dynamic var name = ""
    var actList = List<Activity>()
}

//var hds = List<Activity>()
var realm = try! Realm()
var hds : Results<Activities>!
let tokens = ["img1", "img2", "img3", "img4", "img5", "img6", "img7","img8","img9"]
