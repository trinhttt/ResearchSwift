//
//  BaseViewController.swift
//  Location
//
//  Created by Thai Thi Tu Trinh on 9/27/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

//https://viblo.asia/p/huong-dan-google-map-sdk-va-chi-duong-trong-google-map-swift-3part-1-E375zBLW5GW

class BaseViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var ibMapView: GMSMapView!
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var placesClient: GMSPlacesClient!
    var currentMyLocation = CLLocationCoordinate2D(latitude: 10.8231, longitude: 106.6297)
    var zoomNumber = 12.0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ibMapView.settings.myLocationButton = true
        self.ibMapView.isMyLocationEnabled = true////dùng để bật button di chuyển camera tới vị trí hiện tại của thiết bị
        self.ibMapView.delegate = self
        
        self.ibMapView.settings.compassButton = true
         // độ chính xác khi lấy vị trí của bạn với thực tế
        //kCLLocationAccuracyBestForNavigation: độ chính xác tốt nhất cho những ứng dụng điều hướng realtime
        //kCLLocationAccuracyNearestTenMeters độ chính xác trong khoảng 10m
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
//        } else {
//        }
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()// update vị trí hiện tại của thiết bị trên bản đồ

        locationManager.distanceFilter = 50
        locationManager.delegate = self //conform voi CLLocationManagerDelegate

        //placesClient = GMSPlacesClient.shared()// use for search
        
        self.ibMapView.padding = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)        //change position of myLocation Button
       
        self.addMarker()
        
        
    }
    func addMarker() {
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 10.8231, longitude: 106.6297)
        marker.title = "TPHCM"
        marker.snippet = "VietNam"
        marker.map = self.ibMapView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        
        manager.stopUpdatingLocation()
        if let location: CLLocation = locations.last {
//            let camera = GMSCameraPosition.camera(withLatitude: 10.8231, longitude: 106.6297, zoom: Float(zoomNumber))
            let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: Float(zoomNumber))

            if ibMapView.isHidden {
                ibMapView.isHidden = false
                ibMapView.camera = camera
            } else {
                ibMapView.animate(to: camera)
            }
        }
    }
    
    // Handle authorization for the location manager.
    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            manager.startUpdatingLocation()
        }
    }
    
    // Handle location manager errors.
    func locationManager(_ manager: CLLocationManager,
                         didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        print("Error: \(error)")
    }
}
