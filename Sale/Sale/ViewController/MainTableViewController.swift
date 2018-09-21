//
//  MainTableViewController.swift
//  Sale
//
//  Created by Trinh Thai on 8/23/18.
//  Copyright © 2018 Trinh Thai. All rights reserved.
//

import UIKit
import Kingfisher
import PTPopupWebView
import PopupDialog


class MainTableViewController: UIViewController, UITableViewDelegate,UISearchBarDelegate {
    
     // MARK: - IBOutlet
    @IBOutlet var ibMainTableView: UITableView!
    
    // MARK: - Properties
    var presenter: MainPresenter!
    var searchController: UISearchController!
    var searchResultVC: SearchViewController!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MainPresenter()
        presenter.delegate = self
        searchResultVC = self.storyboard?.instantiateViewController(withIdentifier: "searchResults") as! SearchViewController
        searchController = UISearchController(searchResultsController: searchResultVC)
        addSearchBarToNavigation()
        ibMainTableView.delegate = self
        ibMainTableView.dataSource = self
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.LoadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func didReceiveMemoryWarning() {
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
extension MainTableViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0{
            return 200
        }else if indexPath.section == 0 && indexPath.row == 1{
            return 130
        }else if indexPath.section == 0 && indexPath.row > 1  && indexPath.row < 18{//product
            if indexPath.section == 0 && (indexPath.row) % 2 == 0{
                if displayData?.data.category[indexTitle].products.count == 0{
                    return 0
                }
                else{
                    return 60
                }
            }else{
                if displayData?.data.category[indexTitle].products.count == 0{
                    return 0
                }
                else{
                    if displayData?.data.category[indexTitle].slug == "gao"
                    {
                        return 330
                    }else{
                        return 270
                    }
                }
            }
        }else if indexPath.section == 0 && indexPath.row == 18{//news
            return 60
        }else {
            return 420
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        if indexPath.section == 0 && indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "mainTableViewCell", for: indexPath) as! SlideTableViewCell
            cell.setNumberPagesAndReloadData(countSlideHome: (displayData?.data.slide_home.count) ?? 0)
            return cell
        }
        else if indexPath.section == 0 && indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "menuTableViewCell", for: indexPath) as! MenuTableViewCell
            cell.reload()
            return cell
        }
        else if indexPath.section == 0 && indexPath.row > 1 && indexPath.row < 18 {
            if indexPath.row % 2 == 0{
                indexTitle = indexPath.row/2 - 1
                let cell = tableView.dequeueReusableCell(withIdentifier: "productTitleTableViewCell", for: indexPath) as! ProductTitleTableViewCell
                cell.ibNameKindOfProduct.text = displayData?.data.category[ indexTitle].name
                cell.setValue( image: kindOfProductImages[indexTitle])
                return cell
            }else{
                indexTitle = (indexPath.row - 1)/2 - 1
                if displayData?.data.category[indexTitle].slug == "gao"{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "riceTableViewCell", for: indexPath) as! RiceTableViewCell
                    cell.setTagAndReloadData(tag: (indexPath.row - 1)/2 - 1, numberOfPages: Int(round(Double((displayData?.data.category[indexTitle].products.count)!/3))) + 1)
                    return cell
                }else{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "productInfoTableViewCell", for: indexPath) as! ProductTableViewCell
                    cell.setTagAndReloadData(tag: (indexPath.row - 1)/2 - 1)
                    return cell
                }
            }
        }
        else if indexPath.section == 0 && indexPath.row == 18{
            let cell = tableView.dequeueReusableCell(withIdentifier: "newsTitleTableViewCell", for: indexPath) as! ProductTitleTableViewCell
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "newsTableViewCell", for: indexPath) as! NewsTableViewCell
            cell.reload()
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Clicked row \(indexPath.row)")
        
    }
}
extension MainTableViewController{

    //fileprivate để giới hạn truy cập, hiểu được phạm vi sử dụng của func.
    fileprivate func addSearchBarToNavigation(){
        searchController.searchResultsUpdater = searchResultVC
        if #available(iOS 9.1, *) {
            searchController.obscuresBackgroundDuringPresentation = false
        } else {
        }
        definesPresentationContext = true
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Nhập nội dung cần tìm..."
        searchController.searchBar.sizeToFit()
        searchController.hidesNavigationBarDuringPresentation = false
        self.navigationController?.navigationBar.topItem?.titleView = searchController.searchBar
    }
}
extension MainTableViewController: MainViewPresenter{
    
    func loadDataSuccessful(state: Bool) {
        if state == true {
            print("Loaded data successfully")
             self.ibMainTableView.reloadData()
        }
    }
}
