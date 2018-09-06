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
        ibMSwingButton.layer.cornerRadius =  20
        ibASwingButton.layer.cornerRadius =  20
        ibFCoolButton.layer.cornerRadius =  20
        supportUI.setShadowForButton(ibMSwingButton)
        supportUI.setShadowForButton(ibASwingButton)
        supportUI.setShadowForButton(ibFCoolButton)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
