//
//  ViewController.swift
//  MapSample
//
//  Created by CLEE on 30/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    lazy var locationManager:CLLocationManager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let regionRadius: CLLocationDistance = 1000
//        let location = CLLocation(latitude: 37.515675, longitude: 127.021378)
//        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
//        
//        mapView.setRegion(coordinateRegion, animated: true)

        let location = CLLocation(latitude: 37.515675, longitude: 127.021378)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let coordinateRegion = MKCoordinateRegionMake(location.coordinate, span)
        
        mapView.setRegion(coordinateRegion, animated: false)
        
        let newCoordinate = CLLocationCoordinate2DMake(37.515675, 127.021378)
        let pin1 = MyAnnotation(coordinate: newCoordinate)
        
        mapView.addAnnotation(pin1)
        
        locationManager.requestAlwaysAuthorization()
        
        mapView.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
        
        
        // custom Pin
        let customPin = CustomAnnotaion(title: "Sample", customCoordinate: location.coordinate)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? CustomAnnotation {
            let identity = "pin"
            var pinView: MKPinAnnotationView
            
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identity) as? MKPinAnnotationView {
                dequeuedView.annotation = annotation
                pinView = dequeuedView
            
            } else {
                pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identity)
                pinView.canShowCallout = true
                pinView.calloutOffset = CGPoint(x: -5, y: -5)
                pinView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView
            }
            return pinView
        }
        return nil
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        // callout Action
    }

}

