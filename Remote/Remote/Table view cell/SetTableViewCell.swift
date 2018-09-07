//
//  SetTableViewCell.swift
//  Remote
//
//  Created by Thai Thi Tu Trinh on 9/6/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit

class SetTableViewCell: UITableViewCell {

    @IBOutlet weak var ibSetButton: UIButton!
    @IBOutlet weak var ibClockButton: UIButton!
    @IBOutlet weak var ibOkButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        ibSetButton.layer.cornerRadius =  22
        ibClockButton.layer.cornerRadius =  22
        ibOkButton.layer.cornerRadius =  22
        SupportUI.setShadowForButtons(ibGroupButtons)
        ibClockButton.imageView?.contentMode = .scaleAspectFit
    }
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
                case self.ibSetButton:
                    PublicVariable.chooseButton = 11
                case self.ibClockButton:
                    PublicVariable.chooseButton = 12
                default:
                    PublicVariable.chooseButton = 13
                }
                sender.transform = CGAffineTransform.identity
                let rootView = self.window?.rootViewController as! ViewController
                rootView.ibMainTableView.reloadData()
                
                
        })
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
