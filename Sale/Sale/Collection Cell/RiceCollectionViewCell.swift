//
//  riceCollectionViewCell.swift
//  Sale
//
//  Created by Thai Thi Tu Trinh on 8/24/18.
//  Copyright © 2018 Trinh Thai. All rights reserved.
//

import UIKit

class riceCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var ibRiceOwner: UILabel!
    @IBOutlet weak var ibRiceName: UILabel!
    @IBOutlet weak var ibSaleOffRicePrice: UILabel!
    @IBOutlet weak var ibRicePrice: UILabel!
    
    func configCell(RicePrice:Int,RiceOwner:String,RiceName:String, PriceCalded:Int){
    self.ibRiceName.text = RiceName
    self.ibRiceOwner.text = RiceOwner
        self.ibSaleOffRicePrice.text = SaleProvider.formatNumber(value: Double(RicePrice)) + " đ"
    self.ibRicePrice.text = SaleProvider.formatNumber(value: Double(PriceCalded)) + " đ"
    }
}
