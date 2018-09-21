//
//  ProductTitleTableViewCell.swift
//  Sale
//
//  Created by Thai Thi Tu Trinh on 9/5/18.
//  Copyright © 2018 Trinh Thai. All rights reserved.
//

import UIKit

class ProductTitleTableViewCell: UITableViewCell {
    @IBOutlet weak var ibNameKindOfProduct: UILabel!
    @IBOutlet weak var ibImageKindOfProduct: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setValue(image: String){
        self.ibImageKindOfProduct.image = UIImage(named: image)
    }
}
