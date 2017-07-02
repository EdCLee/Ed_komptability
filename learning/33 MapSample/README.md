# MapView

#### Framework Import

```swift
import UIKit
import MapKit

calss ViewController:UIViewController {

}
```

<br>

#### Show MapView
`용어`
- Region : 지역 (MKCoordinateRegion 사용)
- Span : 펼쳐진 영역(zoom level) - (MKCoordinateSpan 사용)
- Location Coordinate : 좌표
- latitude : 위도 (wgs84 좌표계 사용)
- longitude : 경도 (wgs84 좌표계 사용)

<br>

#### Center 좌표 설정

```swift
	let regionRadius: CLLocationDistance = 1000
	
	let location = CLLocation(latitude: 37.515675, longitude: 127.021378)
	let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
	
	mapView.setRegion(coordinateRegion, animated: true)
	
	//setLocation Location
	let location = CLLocation(latitude: 37.515675, longitude: 127.021378)
	let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
	let coordinateRegion = MKCoordinateRegionMake(location.coordinate, span)
	
	mapView.setRegion(coordinateRegion, animated: true)
```

<br>

#### Pin추가 (Add Annotation)
- MKAnnotaion Protocol을 사용하여 annotation 클래스 생성 (NSObject 필수 상속)
- annotation 인스턴스 생성 후 Mapview에 Add

###### MKAnnotation Protocol

```swift
public protocol MKAnnotation: NSObjectProtocol {
	// Center latitude and longitude of the annotation view.
	// The implementation of this property must be KVO compliant.
	public var coordinate: CLLocationCoordinate2D {get}
	
	// Title and subtitle for use by selection UI.
	optional public var title: String? {get}
	
	optional public var subtitle: String? {get}
}
```

<br>

#### CustomAnnotation Example
```swift
class CustomAnnotaion: NSObject {
    
    var customCoordinate: CLLocationCoordinate2D
    
    var title: String?
    var subtitle: String?
    
    init(title:String, customCoordinate:CLLocationCoordinate2D) {
        self.title = title
        self.customCoordinate = customCoordinate
    }
}

// pin 추가 (add Annotaion)
	let customPin = CustomAnnotaion(title: "Sample", customCoordinate: location.coordinate)
```

<br>

#### MKMapViewDelegate

```swift
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
```

<br>

#### 사용자 위치 설정
- 사용자 허용
	- info.plist 항목 추가(택1) - iOS 10 이상
		- Privacy - Location When In Use Usage Description : YES
		- Privacy - Location Always Usage Description : YES
- Lovation Manager 객체 생성(CLLocationManager)

	```swift
	let manager = CLLocationManager()
	```

	- 현 위치 요청 인증
		- manager.requestAlwaysAuthorization()
		- manager.requestWhenInUseAuthorization()
		
	- 업데이트
		- manager.startUpdatingLocation()
		- manager.stopUpdatingLocation()

```swift
	let manager = CLLocationManager()
		manager.delegate = self
		manager.requestAlwaysAuthorization()
		manager.requestWhenInUseAuthorization()
		manager.desiredAccuracy = kCLLocationAccuracyBest // 위치 정확도
		manager.startUpdatingLocation()
```