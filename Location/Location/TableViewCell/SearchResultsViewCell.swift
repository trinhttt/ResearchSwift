//
//  SearchResultsViewCell.swift
//  Location
//
//  Created by Thai Thi Tu Trinh on 9/27/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit

class SearchResultsViewCell: UITableViewCell {

    @IBOutlet weak var ibPlaceInfo: UILabel!
    @IBOutlet weak var ibDetailInfo: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
