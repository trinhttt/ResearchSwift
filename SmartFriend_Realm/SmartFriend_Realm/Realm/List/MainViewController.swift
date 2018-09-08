//
//  MainViewController.swift
//  SmartFriend_Realm
//
//  Created by Thai Thi Tu Trinh on 8/13/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit
import RealmSwift
import Realm


class MainViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var ibCollectionView: UICollectionView!

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

    return hds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "collectCell", for: indexPath as IndexPath) as! CollectionViewCell
        let item = hds[indexPath.row].actList[0]
        
        cell.img.image=UIImage(named: item.img)
        cell.lblNote.text=item.note
        cell.lblName.text=item.name
        cell.img.layer.cornerRadius=40
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWidth = Int(UIScreen.main.bounds.size.width) / 2 - 10
       
        if ( indexPath.row % 2 == 0) {
            return CGSize(width: itemWidth, height: itemWidth)
        } else {
            return CGSize(width: Int(UIScreen.main.bounds.size.width) -  itemWidth  - 10, height:  itemWidth)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let hd = Activities()
//        hd.name = "1"
//        hd.actList.append(Activity(value: ["img": "img2", "note": "No item","name":"name 2","token":"img2"]))
//
//        try! realm.write {
//            realm.add(hd)
//        }
        

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        hds = realm.objects(Activities.self)
//        print(hds)
        ibCollectionView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
