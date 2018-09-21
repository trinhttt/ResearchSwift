//
//  newsCollectionViewCell.swift
//  Sale
//
//  Created by Thai Thi Tu Trinh on 8/24/18.
//  Copyright © 2018 Trinh Thai. All rights reserved.
//

import UIKit
import Kingfisher

class newsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var ibNewsDescription: UITextView!
    @IBOutlet weak var ibPostDay: UILabel!
    @IBOutlet weak var ibNewsName: UILabel!
    @IBOutlet weak var ibNewsAuthor: UILabel!
    @IBOutlet weak var ibNewsImage: UIImageView!
    
    func configCell(NewsDescription: String,PostDay:String,NewsName: String,NewsAuthor: String,image: String, scrollEnabled: Bool){
        let url = URL(string: SaleProvider.verifyUrl(urlString: image) == true ? image : "https://www.techonline.com/img/tmp/no-image-icon.jpg")
        self.ibNewsImage.kf.setImage(with: url)
        self.ibNewsDescription.text = NewsDescription
        self.ibNewsDescription.isScrollEnabled = scrollEnabled
        self.ibPostDay.text = PostDay
        self.ibNewsName.text = NewsName
        self.ibNewsAuthor.text = NewsAuthor
       
    }
    
}
