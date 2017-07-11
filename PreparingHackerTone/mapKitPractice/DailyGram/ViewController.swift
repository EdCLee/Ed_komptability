//
//  ViewController.swift
//  DailyGram
//
//  Created by CLEE on 07/07/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    private var annotations = [MKPointAnnotation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
    
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(pinLocation))
        longPressGestureRecognizer.minimumPressDuration = 0.3
        mapView.addGestureRecognizer(longPressGestureRecognizer)
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func pinLocation(sender: UILongPressGestureRecognizer) {
        if sender.state != .ended {
            return
        }
        
        let tappedPoint = sender.location(in: mapView)
        let tappedCoordinate = mapView.convert(tappedPoint, toCoordinateFrom: mapView)
        let annotation = MKPointAnnotation()
        annotation.coordinate = tappedCoordinate
        
        annotations.append(annotation)
        
        mapView.showAnnotations([annotation], animated: true)
    }
    
    
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        let annotationView = views[0]
        let endFrame = annotationView.frame
        annotationView.frame = endFrame.offsetBy(dx:0, dy:-600)
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            annotationView.frame = endFrame
        })
    }
    
    
    // renderer 함수!
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay:overlay)
        renderer.lineWidth = 3.0
        renderer.alpha = 1
        renderer.strokeColor = #colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1)
        
        // 라인 버튼을 누르면 루트를 한 화면에서 볼 수 있게 조율 해줌.
        let visibleMapRect = mapView.mapRectThatFits(renderer.polyline.boundingMapRect,edgePadding: UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50))
        mapView.setRegion(MKCoordinateRegionForMapRect(visibleMapRect), animated: true)
        
        return renderer
    }
    
    
    @IBAction func drawLine() {
        
        mapView.removeOverlays(mapView.overlays)
        
        var coordinates = [CLLocationCoordinate2D]()
        
        for annotation in annotations {
            coordinates.append(annotation.coordinate)
        }
    
        let polyLine = MKPolyline(coordinates: &coordinates, count: coordinates.count )
        
        mapView.add(polyLine)
    }
    
    
    func drawDirection(startPoint: CLLocationCoordinate2D, endPoint: CLLocationCoordinate2D) {
        
        // coordinate에서 map item 생성
        let startPlacemark = MKPlacemark(coordinate: startPoint, addressDictionary: nil)
        let endPlacemark = MKPlacemark(coordinate: endPoint, addressDictionary: nil)
        let startMapItem = MKMapItem(placemark: startPlacemark)
        let endMapItem = MKMapItem(placemark: endPlacemark)
        
        // 핀에서 출발/ 도착지 지정
        let directionRequest = MKDirectionsRequest.init()
        
        directionRequest.source = startMapItem
        directionRequest.destination = endMapItem
        directionRequest.transportType = MKDirectionsTransportType.automobile
        
        // 길 방면 계산
        let direction = MKDirections(request:directionRequest)
        direction.calculate { (routeResponse, routeError) -> Void in
            
            guard let routeResponse = routeResponse else {
                if let routeError = routeError {
                    print("Error: \(routeError)")
                }
                return
            }
            let route = routeResponse.routes[0]
            self.mapView.add(route.polyline, level: MKOverlayLevel.aboveRoads)
        }
    }
    
    
    @IBAction func drawRoute() {
        
        mapView.removeOverlays(mapView.overlays)
        
        var coordinates = [CLLocationCoordinate2D]()
        
        for annotation in annotations {
            coordinates.append(annotation.coordinate)
        }
        
        // padding setting
        let polyline = MKPolyline(coordinates: &coordinates, count: coordinates.count)
        let visibleMapRect = mapView.mapRectThatFits(polyline.boundingMapRect, edgePadding: UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50))
        self.mapView.setRegion(MKCoordinateRegionForMapRect(visibleMapRect), animated: true)
        
        var index = 0
        while index < annotations.count - 1 {
            drawDirection(startPoint: annotations[index].coordinate, endPoint: annotations[index + 1].coordinate)
            index += 1
        }
    }
    
    //핀 삭제!
    @IBAction func removeAnnotations() {
        mapView.removeOverlays(mapView.overlays)
        mapView.removeAnnotations(annotations)
        
        annotations.removeAll()
    }

    
}

