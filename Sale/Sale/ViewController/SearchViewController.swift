//
//  SearchViewController.swift
//  Sale
//
//  Created by Thai Thi Tu Trinh on 9/4/18.
//  Copyright © 2018 Trinh Thai. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate,UISearchBarDelegate {
    var originalData: [String] = []
    var filteredData: [String]?
    let searchBar = UISearchBar()
    let searchController = UISearchController(searchResultsController:nil)
    var presenter: SearchResultsPresenter!

    @IBOutlet weak var ibSearchView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        ibSearchView.delegate = self
        ibSearchView.dataSource = self
        presenter = SearchResultsPresenter()
        presenter.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         presenter.LoadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension SearchViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        var itemSearch:String?
        itemSearch = filteredData?[indexPath.row]
        cell.ibName.text = itemSearch
        return cell
    }
}
extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
extension SearchViewController {
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        ibSearchView.reloadData()
    }
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        self.filteredData?.removeAll()
        self.filteredData = self.originalData.filter({( item:String) -> Bool in
            return item.lowercased().contains(searchText.lowercased())
        })
        ibSearchView.reloadData()
    }

}

extension SearchViewController: SearchResultsViewPresenter{
    
    func convertToOriginalData(state: Bool) {
        if state == true {
            var i = 0
            while i < (displayData?.data.category.count)! - 1 {
                self.originalData.append((displayData?.data.category[i].name)!)
                i = i + 1
            }
        }
    }
    func loadDataSuccessful(state: Bool) {
        if state == true {
            print("Loaded data successfully")
            self.ibSearchView.reloadData()
        }
    }
}
