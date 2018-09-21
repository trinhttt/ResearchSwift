//
//  SaleProvider.swift
//  Sale
//
//  Created by Thai Thi Tu Trinh on 9/5/18.
//  Copyright © 2018 Trinh Thai. All rights reserved.
//

import Foundation
import UIKit

class SaleProvider {
    // Set size for an item of collection view in a table cell
    class func setSizeForCollecttionView(_ collectionView: UICollectionView, w:CGFloat, h: CGFloat)->CGSize{
        return CGSize(width: collectionView.frame.size.width/w, height: collectionView.frame.size.height/h)
    }
    
    //Input: 50000 => Output: 50.000
    static func formatNumber(value: Double)->String{
        let numberFormat = NumberFormatter()
        numberFormat.groupingSeparator = "."
        numberFormat.groupingSize = 3
        numberFormat.usesGroupingSeparator = true
        numberFormat.locale = Locale(identifier: Locale.current.identifier)
        let result = numberFormat.string(from: value as NSNumber)
        return result!
    }
    //Check URL
    static func verifyUrl(urlString:String?)->Bool{
        if let urlString = urlString {
            if let url = NSURL(string: urlString) {
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }

}
