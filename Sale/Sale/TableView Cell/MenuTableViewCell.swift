//
//  MenuTableViewCell.swift
//  Sale
//
//  Created by Thai Thi Tu Trinh on 9/5/18.
//  Copyright © 2018 Trinh Thai. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell, UICollectionViewDelegate {
    var selectedToken = -1

@IBOutlet weak var ibMenuCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func reload(){
        self.ibMenuCollectionView.reloadData()
    }

}

extension MenuTableViewCell:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let isSelected = indexPath.item == selectedToken
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCollectionCell", for: indexPath) as! menuCollectionViewCell
        cell.ibNameOfKind.text = displayData?.data.menu[indexPath.row].title
        cell.configCell(MenuImage: kindProductIcons[indexPath.row],SeletedMenuImage: didSelectKindProductIcons[indexPath.row], selected: isSelected)
        return cell        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return kindProductIcons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        customView = CustomDialogViewController(nibName: "CustomDialogViewController", bundle: nil)
        selectedToken = indexPath.row
         collectionView.reloadData()
    }
}
extension MenuTableViewCell:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return SaleProvider.setSizeForCollecttionView(self.ibMenuCollectionView, w: 3, h: 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
