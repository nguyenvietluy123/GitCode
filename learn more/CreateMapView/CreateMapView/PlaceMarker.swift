//
//  PlaceMarker.swift
//  CreateMapView
//
//  Created by Luy Nguyen on 6/8/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit
import GoogleMaps

class PlaceMarker: GMSMarker {
    // 1
    let place: GooglePlace
    
    // 2
    init(place: GooglePlace) {
        self.place = place
        super.init()
        
        position = place.coordinate
        icon = UIImage(named: place.placeType+"_pin")
        groundAnchor = CGPoint(x: 0.5, y: 1)
        appearAnimation = .pop
    }
}
