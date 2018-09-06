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
    
    @IBAction func ibTapUpButton(_ sender: Any) {
        let Transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        UIView.animate(withDuration: 0.05, animations: {
            self.ibUpButton.transform = Transform
        },
        completion:
            {_ in
                self.ibUpButton.transform = CGAffineTransform.identity
                if PublicVariable.degree < 27
                {
                    PublicVariable.degree = PublicVariable.degree + 1
                    print("Now, degree is \(PublicVariable.degree) ℃")
                    let rootView = self.window?.rootViewController as! ViewController
                    rootView.ibMainTableView.reloadData()
                }else{
                    print("Do nothing")
                }
        })
        
        
    }
    @IBAction func ibTapDownButton(_ sender: Any) {
        let Transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        UIView.animate(withDuration: 0.05, animations: {
            self.ibDownButton.transform = Transform
        },
        completion:
            {_ in
                self.ibDownButton.transform = CGAffineTransform.identity
                if PublicVariable.degree > 17
                {
                    PublicVariable.degree = PublicVariable.degree - 1
                    print("Now, degree is \(PublicVariable.degree) ℃")
                    let rootView = self.window?.rootViewController as! ViewController
                    rootView.ibMainTableView.reloadData()
                }else{
                    print("Do nothing")
                }
        })
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        ibModeButton.layer.cornerRadius =  20
        ibWindButton.layer.cornerRadius =  20
        ibUpButton.layer.cornerRadius =  20
        ibDownButton.layer.cornerRadius =  20
        supportUI.setShadowForButton(ibUpButton)
        supportUI.setShadowForButton(ibDownButton)
        supportUI.setShadowForButton(ibModeButton)
        supportUI.setShadowForButton(ibWindButton)
        
        ibUpButton.imageView?.contentMode = .scaleAspectFit
        ibDownButton.imageView?.contentMode = .scaleAspectFit
    }
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
