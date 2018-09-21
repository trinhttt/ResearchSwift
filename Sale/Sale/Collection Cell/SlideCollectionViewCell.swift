//
//  slideCollectionViewCell.swift
//  Sale
//
//  Created by Thai Thi Tu Trinh on 8/27/18.
//  Copyright © 2018 Trinh Thai. All rights reserved.
//

import UIKit
import Kingfisher

class slideCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var ibSlideImage: UIImageView!
    
    func configCell(slideImage: String, displayDataNil: Bool){
        if displayDataNil == false{
            let url = URL(string: slideImage)
            self.ibSlideImage.kf.setImage(with: url)
        }
        else{
            self.ibSlideImage.image = UIImage(named: slideImage)
        }
    }
}
