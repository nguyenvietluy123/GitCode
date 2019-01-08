//
//  ViewController.swift
//  CreateMapView
//
//  Created by Luy Nguyen on 6/6/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit
import  GoogleMaps

class MapViewController: UIViewController {
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var addressLabel: UILabel!
    
    private let dataProvider = GoogleDataProvider()
    private let searchRadius: Double = 1000
    
    private let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        mapView.delegate = self
    }
    
    private func reverseGeocodeCoordinate(_ coordinate: CLLocationCoordinate2D) {
        
        // 1
        let geocoder = GMSGeocoder()
        
        // 2
        geocoder.reverseGeocodeCoordinate(coordinate) { response, error  in
            guard let address = response?.firstResult(), let lines = address.lines else {
                return
            }
            
            // 3
            self.addressLabel.text = lines.joined(separator: "\n")
            
            // 4
            let labelHeight = self.addressLabel.intrinsicContentSize.height
            self.mapView.padding = UIEdgeInsets(top: self.view.safeAreaInsets.top, left: 0,
                                                bottom: labelHeight, right: 0)
            UIView.animate(withDuration: 0.25) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    

}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            return
        }
        
        locationManager.startUpdatingLocation()
        
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }

        mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)

        locationManager.stopUpdatingLocation()
    }
}

extension MapViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        reverseGeocodeCoordinate(position.target)
    }
}
