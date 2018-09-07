//
//  APIHelper.swift
//  Remote
//
//  Created by Thai Thi Tu Trinh on 9/6/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import Foundation
import UIKit

class SupportUI{
  
    static func setShadowForButtons(_ buttons: [UIButton]){
        for index in buttons.indices {
            let button = buttons[index]
            button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
            button.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
            button.layer.shadowOpacity = 1.0
            button.layer.shadowRadius = 0.0
        }
    }
    
    static func setAnimationForButton(_ button: UIButton){
        let Transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        UIView.animate(withDuration: 0.1, animations: {
            button.transform = Transform
        },
                       completion:
            {_ in
                button.transform = CGAffineTransform.identity
        })
    }
}

