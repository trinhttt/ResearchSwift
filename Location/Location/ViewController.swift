//
//  ViewController.swift
//  Location
//
//  Created by Thai Thi Tu Trinh on 9/25/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit
import GoogleMaps


class ViewController: UIViewController,GMSMapViewDelegate  {

    @IBOutlet weak var ibMapView: GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withLatitude: 21.028511, longitude: 105.804817, zoom: 6.0)
        self.ibMapView.camera = camera
        self.ibMapView.settings.myLocationButton = true
        self.ibMapView.isMyLocationEnabled = true
        
        //change position of myLocation Button
        self.ibMapView.padding = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)

        self.addMarker()
    }

    //func display marker
    func addMarker() {
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 21.028511, longitude: 105.804817)
        marker.title = "HaNoi"
        marker.snippet = "VietNam"
        marker.map = self.ibMapView
    }
    
    func addMarker(_ coordinate: CLLocationCoordinate2D) {
        let marker = GMSMarker()
        marker.position = coordinate
        marker.map = self.ibMapView
        
    }
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        self.ibMapView.clear()
        // self.addMarker()
        self.addMarker(coordinate)
    }
    
    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        print("true")
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

