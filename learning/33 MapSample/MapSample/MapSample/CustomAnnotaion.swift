//
//  CustomAnnotaion.swift
//  MapSample
//
//  Created by CLEE on 30/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit
import MapKit

class CustomAnnotaion: NSObject {
    
    var customCoordinate: CLLocationCoordinate2D
    
    var title: String?
    var subtitle: String?
    
    init(title:String, customCoordinate:CLLocationCoordinate2D) {
        self.title = title
        self.customCoordinate = customCoordinate
    }

}
