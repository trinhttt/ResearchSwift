//
//  AlamofireViewController.swift
//  SmartFriend_Realm
//
//  Created by Thai Thi Tu Trinh on 8/15/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire
import Reachability
class AlamofireViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var bntLoading: UIButton!
    @IBOutlet weak var ibActivityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var ibTableView: UITableView!
//    var sv : UIView?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if data_display != nil{
            return (data_display?.item_list.count)!
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "AlamCell") as! AlamofireTableViewCell
        let item = data_display?.item_list[indexPath.row]

        let url = URL(string: item!.img_url)
        cell.ibAlamImage.kf.setImage(with: url)
        cell.ibAlamName.text=item?.name
        cell.ibAlamDescription.text=item?.description
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        RequestData.shared.CheckConect(viewController: self)
        RequestData.shared.EXE(ibTableView: ibTableView, view: self.view)
        ibTableView.rowHeight = 105
        ibTableView.reloadData()
        

        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    

    

}
