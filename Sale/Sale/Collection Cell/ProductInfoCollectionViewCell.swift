//
//  productInfoCollectionViewCell.swift
//  Sale
//
//  Created by Thai Thi Tu Trinh on 8/24/18.
//  Copyright © 2018 Trinh Thai. All rights reserved.
//

import UIKit

class productInfoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var ibProductPrice: UILabel!
    @IBOutlet weak var ibProductOwner: UILabel!
    @IBOutlet weak var ibProductName: UILabel!
    @IBOutlet weak var ibProductImage: UIImageView!

    func configCell(ProductPrice:String,ProductOwner:String,ProductName:String, image: String){
        self.ibProductName.text = ProductName
        self.ibProductOwner.text = ProductOwner
        self.ibProductPrice.text = ProductPrice
        let url = URL(string: SaleProvider.verifyUrl(urlString: image) == true ? image : "https://www.techonline.com/img/tmp/no-image-icon.jpg")
        self.ibProductImage.kf.setImage(with: url)
    }
}

