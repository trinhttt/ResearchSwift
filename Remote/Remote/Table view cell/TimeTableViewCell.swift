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
    override func awakeFromNib() {
        super.awakeFromNib()
        ibTimeOffButton.layer.cornerRadius =  20
        ibFHeatButton.layer.cornerRadius =  20
        supportUI.setShadowForButton(ibTimeOnButton)
        supportUI.setShadowForButton(ibTimeOffButton)
        supportUI.setShadowForButton(ibFHeatButton)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
