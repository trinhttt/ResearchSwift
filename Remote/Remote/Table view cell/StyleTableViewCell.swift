//
//  StyleTableViewCell.swift
//  Remote
//
//  Created by Thai Thi Tu Trinh on 9/6/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit

class StyleTableViewCell: UITableViewCell {

    @IBOutlet weak var ibMSwingButton: UIButton!
    @IBOutlet weak var ibASwingButton: UIButton!
    @IBOutlet weak var ibFCoolButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        ibMSwingButton.layer.cornerRadius =  22
        ibASwingButton.layer.cornerRadius =  22
        ibFCoolButton.layer.cornerRadius =  22
         SupportUI.setShadowForButtons(ibGroupButtons)
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
                case self.ibMSwingButton:
                    PublicVariable.chooseButton = 5
                case self.ibASwingButton:
                    PublicVariable.chooseButton = 6
                default:
                    PublicVariable.chooseButton = 7
                }
                sender.transform = CGAffineTransform.identity
                let rootView = self.window?.rootViewController as! ViewController
                rootView.ibMainTableView.reloadData()
                
                
        })
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
