//
//  AddViewController.swift
//  SmartFriend_Realm
//
//  Created by Thai Thi Tu Trinh on 8/13/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit
import RealmSwift

class AddViewController: UITableViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var selectedToken = 0
    @IBOutlet weak var ibTextFieldName: UITextField!
    @IBOutlet weak var ibTokenCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 && indexPath.row == 0 {
            return 60*2 + 30
        } else {
            return 56
        }
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 45
        } else {
            return 25
        }
    }
//    hds.name = "1"
//    hds.actList.append(Activity(value: ["img": "img2", "note": "No item","name":"name 2","token":"img2"]))
//
//    try! realm.write {
//    realm.add(hds)
//    }
    @IBAction func addBnt(_ sender: Any) {
    
        let hd = Activities()
        hd.name = ibTextFieldName.text!
        print(tokens[selectedToken])
        print(ibTextFieldName.text!)
        hd.actList.append(Activity(value: ["img": tokens[selectedToken],"note": "No item","name":ibTextFieldName.text!]))
        try! realm.write ({
            realm.add(hd)
        })
        hds = realm.objects(Activities.self)
//        let mainViewController = navigationController?.viewControllers.first as! MainViewController
//        mainViewController.ibCollectionView.reloadData()
        navigationController?.popViewController(animated: true)

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9//tokens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let tokenCell = collectionView.dequeueReusableCell(withReuseIdentifier: "tokenCell", for: indexPath) as! TokenCollectionViewCell
        
        let isSelected = indexPath.item == selectedToken
        let tokenName = tokens[indexPath.item]//items![indexPath.item].img//lists[0].list[indexPath.item].img
        tokenCell.token.image = UIImage(named: tokenName)
        let affineTransform = isSelected ? CGAffineTransform(scaleX: 1.4, y: 1.4) : CGAffineTransform.identity
        UIView.animate(withDuration: 0.1, animations: {
            tokenCell.transform = affineTransform
        })
        
        return tokenCell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedToken = indexPath.item
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 65)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
