//
//  SearchResultViewController.swift
//  Location
//
//  Created by Thai Thi Tu Trinh on 9/27/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit
import Alamofire

protocol LocationSelectCallBack {
    func locationSelected(location: LocationData)
}
class SearchResultViewController: UITableViewController {
    var delegate: LocationSelectCallBack?
    var mainDelegate: MainViewProtocol?

    var listData: [LocationData] = [LocationData]()
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultsViewCell") as! SearchResultsViewCell
        cell.ibPlaceInfo.text = listData[indexPath.row].mainText
        cell.ibDetailInfo.text = listData[indexPath.row].secondary_text
        return cell
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.locationSelected(location: listData[indexPath.row])
    }
    func locationSelected(location: LocationData) {
        print(location.locationId)
        let urlString = "https://maps.googleapis.com/maps/api/place/details/json?key=\(SupportAPI.SERVER_KEY)&language=vi&placeid=\(location.locationId)"
        Alamofire.request(urlString).responseJSON { response in
            if let data = response.data {
                let directionData: Dictionary? = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                print("0000")
                print(directionData)
                let resultObject: [String: Any] = directionData?["result"] as! [String: Any]
                let name = resultObject["name"] as! String
                let address = resultObject["formatted_address"] as! String
                let geometry = resultObject["geometry"] as! [String: Any]
                let location = geometry["location"] as! [String: Any]
                
                let lat: Double = location["lat"] as! Double
                let lng: Double = location["lng"] as! Double
                
                self.mainDelegate?.drawMarker(lat: lat, lng: lng, nameInfo: name, addressInfo: address)
                //self.searchCtrl?.isActive = false
            }
        }
    }
}

extension SearchResultViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        let searchInput = searchController.searchBar.text
        
        if searchInput?.trimmingCharacters(in: CharacterSet.whitespaces) == "" {
            listData.removeAll()
            tableView.reloadData()
            return
        }
        
        let urlString = "https://maps.googleapis.com/maps/api/place/autocomplete/json?key=\(SupportAPI.SERVER_KEY)&components=country:vn&input=\(searchInput!.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)"
        
        Alamofire.request(urlString).responseJSON { response in
            var newPredictions: [LocationData] = [LocationData]()
            if let data = response.data {
                if data.count > 0 {
                    let directionData: Dictionary? = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    print("--------------------")
                    print(directionData as Any)
                    print("--------------------")
                    let prediction: NSArray? = directionData!["predictions"] as? NSArray
                    guard prediction != nil else {
                        return
                    }
                    
                    for item in prediction! {
                        let locationPrediction = LocationData()
                        locationPrediction.map(inputData: item as! [String: Any])
                        newPredictions.append(locationPrediction)
                    }
                }
            }
            self.listData = newPredictions
            self.tableView.reloadData()
        }
    }
    
    
}
