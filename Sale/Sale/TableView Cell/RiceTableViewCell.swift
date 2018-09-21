//
//  RiceTableViewCell.swift
//  Sale
//
//  Created by Thai Thi Tu Trinh on 9/5/18.
//  Copyright © 2018 Trinh Thai. All rights reserved.
//

import UIKit

class RiceTableViewCell: UITableViewCell, UICollectionViewDelegate {
    @IBOutlet weak var ibRiceCollectionView: UICollectionView!
    @IBOutlet weak var ibRicePageControl: UIPageControl!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setTagAndReloadData(tag: Int, numberOfPages:Int){
        self.ibRiceCollectionView.tag = tag
        self.ibRiceCollectionView.reloadData()
        self.ibRicePageControl.numberOfPages = numberOfPages

    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let Number = round(self.ibRiceCollectionView.contentOffset.x / self.ibRiceCollectionView.frame.size.width)
        self.ibRicePageControl.currentPage = Int(Number)
        
    }
}

extension RiceTableViewCell:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "riceCollectionCell", for: indexPath) as! riceCollectionViewCell
        let item = displayData?.data.category[ self.ibRiceCollectionView.tag].products[indexPath.row]
        cell.configCell(RicePrice:(item?.price)!,RiceOwner:(item?.slug)!,RiceName:(item?.title)!, PriceCalded:(item?.price_calded)!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return (displayData?.data.category[ self.ibRiceCollectionView.tag].products.count) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        customView = CustomDialogViewController(nibName: "CustomDialogViewController", bundle: nil)
        print("selected item at index path \(indexPath)")
        customView.showCustomDialog(indexPath.row,1,self.ibRiceCollectionView.tag)
        collectionView.reloadData()
    }
}
extension RiceTableViewCell:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       return SaleProvider.setSizeForCollecttionView(self.ibRiceCollectionView, w: 1, h: 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

