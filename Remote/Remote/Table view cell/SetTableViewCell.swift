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
        ibSetButton.layer.cornerRadius =  20
        ibClockButton.layer.cornerRadius =  20
        ibOkButton.layer.cornerRadius =  20
        supportUI.setShadowForButton(ibSetButton)
        supportUI.setShadowForButton(ibClockButton)
        supportUI.setShadowForButton(ibOkButton)
        ibClockButton.imageView?.contentMode = .scaleAspectFit
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
