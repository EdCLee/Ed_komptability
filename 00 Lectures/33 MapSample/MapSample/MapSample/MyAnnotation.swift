//
//  MyAnnotation.swift
//  MapSample
//
//  Created by CLEE on 30/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit
import MapKit


class MyAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D

    init(coordinate:CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
    

}
