//
//  ProductTableViewCell.swift
//  Sale
//
//  Created by Thai Thi Tu Trinh on 9/5/18.
//  Copyright © 2018 Trinh Thai. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell, UICollectionViewDelegate {
    
    @IBOutlet weak var ibProductCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setTagAndReloadData(tag: Int){
        self.ibProductCollectionView.tag = tag
        self.ibProductCollectionView.reloadData()
    }
}

extension ProductTableViewCell:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productInfoCollectionCell", for: indexPath) as! productInfoCollectionViewCell
        let item = displayData?.data.category[ self.ibProductCollectionView.tag].products[indexPath.row]
        cell.configCell(ProductPrice:SaleProvider.formatNumber(value: Double((item?.price_calded)!)) + " đ",ProductOwner: item?.slug ?? "",ProductName: item?.title ?? "", image: (item?.image)!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (displayData?.data.category[self.ibProductCollectionView.tag].products.count) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        customView = CustomDialogViewController(nibName: "CustomDialogViewController", bundle: nil)
        print("selected item at index path \(indexPath)")
        customView.showCustomDialog(indexPath.row,0,self.ibProductCollectionView.tag)
        collectionView.reloadData()
    }
}

extension ProductTableViewCell:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return SaleProvider.setSizeForCollecttionView(self.ibProductCollectionView, w: 2.3, h: 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
