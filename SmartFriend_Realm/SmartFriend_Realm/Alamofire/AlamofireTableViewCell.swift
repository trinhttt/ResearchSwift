//
//  AlamofireTableViewCell.swift
//  SmartFriend_Realm
//
//  Created by Thai Thi Tu Trinh on 8/15/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit

class AlamofireTableViewCell: UITableViewCell {

    @IBOutlet weak var ibAlamImage: UIImageView!
    @IBOutlet weak var ibAlamName: UILabel!
    @IBOutlet weak var ibAlamDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
