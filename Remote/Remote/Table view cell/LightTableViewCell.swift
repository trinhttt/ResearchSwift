//
//  LightTableViewCell.swift
//  Remote
//
//  Created by Thai Thi Tu Trinh on 9/6/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit

class LightTableViewCell: UITableViewCell {

    @IBOutlet weak var ibLightBnt: UIButton!
    @IBOutlet weak var ibOnOffBnt: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        ibLightBnt.layer.cornerRadius =  ibLightBnt.bounds.size.width / 2.0
        ibOnOffBnt.layer.cornerRadius =  ibOnOffBnt.bounds.size.width / 2.0
        SupportUI.setShadowForButtons(ibGroupButtons)
        ibLightBnt.imageView?.contentMode = .scaleAspectFit
        ibOnOffBnt.imageView?.contentMode = .scaleAspectFit
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
                case self.ibLightBnt:
                    PublicVariable.chooseButton = 1
                default:
                    PublicVariable.chooseButton = 2
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
