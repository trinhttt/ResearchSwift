//
//  TimeTableViewCell.swift
//  Remote
//
//  Created by Thai Thi Tu Trinh on 9/6/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit

class TimeTableViewCell: UITableViewCell {

    @IBOutlet weak var ibTimeOnButton: UIButton!
    @IBOutlet weak var ibTimeOffButton: UIButton!
    @IBOutlet weak var ibFHeatButton: UIButton!
    
    @IBOutlet var ibGroupButtons: [UIButton]!
    
    @IBAction private func ibTouchButton(_ sender: UIButton) {
            print(sender)
        let Transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        UIView.animate(withDuration: 0.05, animations: {
            sender.transform = Transform
        },
                       completion:
            {_ in
                
                switch sender{
                    case self.ibTimeOnButton:
                        PublicVariable.chooseButton = 8
                    case self.ibTimeOffButton:
                        PublicVariable.chooseButton = 9
                    default:
                        PublicVariable.chooseButton = 10
                }
                sender.transform = CGAffineTransform.identity
                let rootView = self.window?.rootViewController as! ViewController
                rootView.ibMainTableView.reloadData()
                
               
        })
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        ibTimeOffButton.layer.cornerRadius =  22
        ibFHeatButton.layer.cornerRadius =  22
        SupportUI.setShadowForButtons(ibGroupButtons)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
