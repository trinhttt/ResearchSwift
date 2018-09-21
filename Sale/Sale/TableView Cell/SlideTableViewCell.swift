//
//  SlideTableViewCell.swift
//  Sale
//
//  Created by Thai Thi Tu Trinh on 9/5/18.
//  Copyright © 2018 Trinh Thai. All rights reserved.
//

import UIKit

class SlideTableViewCell: UITableViewCell,UICollectionViewDelegate {

    @IBOutlet weak var ibSlideCollectionView: UICollectionView!
    @IBOutlet weak var ibSlideControl: UIPageControl!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setNumberPagesAndReloadData(countSlideHome: Int){
        self.ibSlideControl.numberOfPages = countSlideHome
        self.ibSlideCollectionView.reloadData()
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let Number = round(self.ibSlideCollectionView.contentOffset.x / self.ibSlideCollectionView.frame.size.width)
            self.ibSlideControl.currentPage = Int(Number)       
    }
}
extension SlideTableViewCell:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "slideCollectionCell", for: indexPath) as! slideCollectionViewCell
        cell.configCell(slideImage: (displayData?.data.slide_home[indexPath.row].img_source)!,displayDataNil :  displayData != nil ? false : true)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return (displayData?.data.slide_home.count) ?? 0
    }
}
extension SlideTableViewCell:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return SaleProvider.setSizeForCollecttionView(self.ibSlideCollectionView, w: 1, h: 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
