//
//  NavigationSupport.swift
//  Location
//
//  Created by Thai Thi Tu Trinh on 9/27/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import Alamofire
import Foundation
import GoogleMaps
import GooglePlaces
import UIKit
class NavigationItem: UINavigationItem {
    
    var searchCtrl: UISearchController?
    var mainDelegate: MainViewProtocol?

    func setSearchIntoNavigation(storyBoard: UIStoryboard) {
        let resultsViewController = storyBoard.instantiateViewController(withIdentifier: "SearchResultView") as! SearchResultViewController
        resultsViewController.delegate = self
        
        searchCtrl = UISearchController(searchResultsController: resultsViewController)
        searchCtrl?.searchResultsUpdater = resultsViewController
        searchCtrl?.searchBar.placeholder = "Tìm kiếm"
        searchCtrl?.searchBar.setValue("Hủy", forKey: "cancelButtonText")
        searchCtrl?.searchBar.sizeToFit()
        searchCtrl?.hidesNavigationBarDuringPresentation = false
        titleView = searchCtrl?.searchBar
    }

}

extension NavigationItem : LocationSelectCallBack{
    func locationSelected(location: LocationData) {
        
        let urlString = "https://maps.googleapis.com/maps/api/place/details/json?key=\(SupportAPI.SERVER_KEY)&language=vi&placeid=\(location.locationId)"
        Alamofire.request(urlString).responseJSON { response in
            if let data = response.data {
                let directionData: Dictionary? = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                print(directionData)
                let resultObject: [String: Any] = directionData?["result"] as! [String: Any]
                let name = resultObject["name"] as! String
                let address = resultObject["formatted_address"] as! String
                let geometry = resultObject["geometry"] as! [String: Any]
                let location = geometry["location"] as! [String: Any]
                
                let lat: Double = location["lat"] as! Double
                let lng: Double = location["lng"] as! Double

                self.mainDelegate?.drawMarker(lat: lat, lng: lng, nameInfo: name, addressInfo: address)
                self.searchCtrl?.isActive = false
            }
        }
    }
}


