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
        supportUI.setShadowForButton(ibLightBnt)
        supportUI.setShadowForButton(ibOnOffBnt)
        ibLightBnt.imageView?.contentMode = .scaleAspectFit
        ibOnOffBnt.imageView?.contentMode = .scaleAspectFit
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
