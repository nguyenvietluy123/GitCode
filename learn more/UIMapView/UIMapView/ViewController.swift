//
//  ViewController.swift
//  UIMapView
//
//  Created by Luy Nguyen on 8/22/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{
    
    @IBOutlet weak var myMap: MKMapView!
    
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        
    }
    
    var newAnnotaion = MKPointAnnotation()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation: CLLocation = locations[0]
        let lattitude: CLLocationDegrees = userLocation.coordinate.latitude
        let longtitude: CLLocationDegrees = userLocation.coordinate.longitude
        let latDelta: CLLocationDegrees = 0.01
        let longDelta: CLLocationDegrees = 0.01
        
        let location = CLLocationCoordinate2DMake(lattitude, longtitude)
        let span = MKCoordinateSpanMake(latDelta, longDelta)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        myMap.setRegion(region, animated: true)
        
        newAnnotaion.coordinate = location
        newAnnotaion.title = "Mr. Luy"
        newAnnotaion.subtitle = "I'm here!"
        myMap.addAnnotation(newAnnotaion)
    }


}

