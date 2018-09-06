//
//  DisplayDegreeTableViewCell.swift
//  Remote
//
//  Created by Thai Thi Tu Trinh on 9/6/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit

class DisplayDegreeTableViewCell: UITableViewCell {

    @IBOutlet weak var ibBackgroundView: UIView!
    @IBOutlet weak var ibDisplayView: UIView!
    @IBOutlet weak var ibDegreeLabel: UILabel!
    @IBOutlet weak var ibMinMax: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ibBackgroundView.layer.cornerRadius = 20
        ibDisplayView.layer.cornerRadius = 10
        ibDegreeLabel.text = String(PublicVariable.degree) + "℃"
//        ibBackgroundView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
//        ibBackgroundView.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
//        ibBackgroundView.layer.shadowOpacity = 1.0
//        ibBackgroundView.layer.shadowRadius = 0.0
        ibDisplayView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
        ibDisplayView.layer.shadowOffset = CGSize(width: 1, height: 1)
        ibDisplayView.layer.shadowOpacity = 1.0
        ibDisplayView.layer.shadowRadius = 0.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

