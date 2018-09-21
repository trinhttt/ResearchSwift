//
//  NewsTableViewCell.swift
//  Sale
//
//  Created by Thai Thi Tu Trinh on 9/5/18.
//  Copyright © 2018 Trinh Thai. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell, UICollectionViewDelegate {
    @IBOutlet weak var ibNewsCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func reload(){
        self.ibNewsCollectionView.reloadData()
    }
}

extension NewsTableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsCollectionCell", for: indexPath) as! newsCollectionViewCell
        let item = displayData?.data.home_news[indexPath.row]
        cell.configCell(NewsDescription:(item?.short_content)!,PostDay:(item?.created_date)!,NewsName:(item?.title)!,NewsAuthor:(item?.id)!, image:(item?.image)!, scrollEnabled: false )
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  (displayData?.data.home_news.count) ?? 0
    }
    
    
}
extension NewsTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return SaleProvider.setSizeForCollecttionView(self.ibNewsCollectionView, w: 1, h: 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

