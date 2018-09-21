//
//  menuCollectionViewCell.swift
//  Sale
//
//  Created by Trinh Thai on 8/24/18.
//  Copyright © 2018 Trinh Thai. All rights reserved.
//

import UIKit

class menuCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var ibNameOfKind: UITextView!
    @IBOutlet weak var ibMenuImage: UIImageView!
    
    func configCell(MenuImage:String,SeletedMenuImage:String, selected: Bool){
        if selected{
            self.ibMenuImage.image = UIImage(named: SeletedMenuImage)
            self.ibNameOfKind.textColor = .orange
        }else{
            self.ibMenuImage.image = UIImage(named: MenuImage)
            self.ibNameOfKind.textColor = .black
        }
        
        
    }
}
