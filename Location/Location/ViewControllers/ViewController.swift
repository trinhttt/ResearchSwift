//
//  ViewController.swift
//  Location
//
//  Created by Thai Thi Tu Trinh on 9/25/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
protocol MainViewProtocol {
    func drawMarker(lat: Double, lng: Double, nameInfo: String, addressInfo: String)

}
class ViewController: BaseViewController  {
    var searchCtrl: UISearchController?
    var currentMarker: GMSMarker?

    @IBOutlet var navigation: NavigationItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigation.setSearchIntoNavigation(storyBoard: storyboard!)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: MainViewProtocol{
    func drawMarker(lat: Double, lng: Double, nameInfo: String, addressInfo: String) {
        currentMarker?.map = nil
        currentMarker = GMSMarker()
        currentMarker!.position = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        currentMarker!.title = "\(nameInfo)"
        currentMarker!.snippet = "\(addressInfo)"
        currentMarker!.map = ibMapView
        
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: lng, zoom: 12.0)
        
        if ibMapView.isHidden {
            ibMapView.isHidden = false
            ibMapView.camera = camera
        } else {
            ibMapView.animate(to: camera)
        }
//        let newViewController = ViewController()
//        self.present(newViewController, animated:true, completion:nil)


    }
}
