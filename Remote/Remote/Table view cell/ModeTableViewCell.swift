//
//  ModeTableViewCell.swift
//  Remote
//
//  Created by Thai Thi Tu Trinh on 9/6/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit

class ModeTableViewCell: UITableViewCell {

    @IBOutlet weak var ibWindButton: UIButton!
    @IBOutlet weak var ibModeButton: UIButton!
    
    @IBOutlet weak var ibUpButton: UIButton!
    @IBOutlet weak var ibDownButton: UIButton!
    @IBOutlet var ibGroupButtons: [UIButton]!
    
    @IBAction func ibTouchButton(_ sender: UIButton) {
        print(sender)
        let Transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        UIView.animate(withDuration: 0.05, animations: {
            sender.transform = Transform
        },
                       completion:
            {_ in
                switch sender{
                case self.ibModeButton:
                    PublicVariable.chooseButton = 3
                case self.ibWindButton:
                    PublicVariable.chooseButton = 4
                case self.ibUpButton:
                    if PublicVariable.degree < 27
                    {
                        PublicVariable.degree = PublicVariable.degree + 1
                    }
                default:
                    if PublicVariable.degree > 17
                    {
                        PublicVariable.degree = PublicVariable.degree - 1
                    }
                }
                sender.transform = CGAffineTransform.identity
                let rootView = self.window?.rootViewController as! ViewController
                rootView.ibMainTableView.reloadData()
                
                
        })
    }
   
    override func awakeFromNib() {
        super.awakeFromNib()
        ibModeButton.layer.cornerRadius =  22
        ibWindButton.layer.cornerRadius =  22
        ibUpButton.layer.cornerRadius =  22
        ibDownButton.layer.cornerRadius =  22
         SupportUI.setShadowForButtons(ibGroupButtons)
        
        ibUpButton.imageView?.contentMode = .scaleAspectFit
        ibDownButton.imageView?.contentMode = .scaleAspectFit
    }
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
