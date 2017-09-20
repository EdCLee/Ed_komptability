# UI Base Guide

> QuickHelp에 UIView 검색
>
> UIView에는 UI에 관련된 모든게 들어있고 모든 UI는 UIView를 상속받는다.

- Pixel과 Point라는 단위를 사용 함.
	- Pixel은 이미지의 사이즈, Point는 화면에 표시되는 이미지 사이즈.
	- Pixel과 Point는 2:1 비율이다. 가로세로 4칸의 Point가 1pixel인 셈.
- 안드로이드는 DPI를 사용함. (dot per inch)
- letina는 pixel의 x2, plus 모델은 x3

#### 좌표계 (frame-base)
- 좌측 상단이 0,0 기준에 x와 y로 포인트의 증가값등을 표시하는 것. 
- (10, 10, 100, 100) -> x로 10, y로 10을 이동해서 100x100 사이즈로 그림을 표시하라는 의미.
- 상대적인 좌표를 가지고 있다.

# UI Code

#### Framework
- Cocoa touch framework을 사용하게 됨.

```swift
	import UIKit
```
- 지도관련된 UI 사용할땐,

```swift
	import MapKit
```

#### UI Hierarchy
- 최상위 UI 클래스는 `NSObject`이고 상속받는 `UIResponder` 밑에 `UIViewController`와 `UIView`, `UIApplication`이 있다.

```
NSObject > UIResponder > UIViewController, UIView, UIApplication
```

#### UIResponder

- 슬라이드, 터치, 더블탭 등의 gesture는 `UIGesture`이며 `UIResponder`의 `touchesBegan`, `touchesMoved` 등의 함수는 좀 더 디테일한 설정을 할때 `override`를 통해 작업이 가능하다.

#### UIView
> 가장 기본이 되는 View

- iOS의 화면구성은 `UIView`의 집합으로 되어 있다.
- `tag`, `layer`, `frame`, `bounds`, `isMultiTouchEnabled`, `clipsToBounds`, `backgroundColor`, `isHidden` 등이 있다
	- `frame`은 x, y, width, height이고 `bounds`는 0, 0, width, height 이다.
	- `backgroundColor: UIColor?` 는 RGBA 색상으로 표현한다.
	- RGBA의 투명색과 hidden의 차이는 터치가 되고 안되고, 메모리가 존재하고 안하고의 차이이다.
- `addSubView`로 계층 View를 만들 수 있다.
- `removeSubView`로 계층 View를 없앨 수 있다.

```swift
	override func viewDidLoad() {
	        super.viewDidLoad()
	        
	        let secondView:UIView = UIView(frame:CGRect(x: 70, y: 70, width: 100, height: 120))
	        secondView.backgroundColor = UIColor.black
	        self.view.addSubview(secondView)
	        
	        let titleLB:UILabel = UILabel(frame:CGRect(x: 70, y: 190, width: 100, height: 100))
	        titleLB.backgroundColor = UIColor.red
	        titleLB.text = "이건 label뷰야"
	        self.view.addSubview(titleLB)
	        
	    }
```

#### UIImageView
- 이미지 파일은 이미지 인스턴스를 바꿔야 함
- `imgName.contentMode = .scaleAspectFit` 비율 유지
- `imgName.contentMode = .scaleAspectFill` 비율 유지하고 채우기.

## Assets

#### Asset Catalogs
> Universal 및 각각의 resolution에 알맞은 이미지 처리.

- 효율적인 리소스 관리를 위해 사용
- 각 디바이스 별로 알맞은 이미지 크기로 사용하기 위해 리소스를 매칭 해서 사용한다.
- trait collection의 정보에 따라 적절한 이미지를 찾아준다.

<br>
<br>
## 정리
###### UIView

```swift
	//객체 생성
	let newView = UIView(frame:CGRect(x: 0, y: 0, width: 100, height: 100))
	
	//배경 색 변경
	newView.backgroundColor = UIColor.green
	
	//뷰 투명도 50%
	newView.alpha = 0.5
	
	//뷰 화면에 추가하기
	self.view.addSubview(newView)
	
	//superView라는 곳에 종속 시키려면
	superView.addSubview(newView)
```
###### UILabel 

```swift
	//객체 생성
	let newLb = UILabel(frame:CGRect(x: 0, y: 0, width:100, height: 30))
	
	//텍스트 표기
	newLb.text = "표기!"
	
	//텍스트 색 변경
	newLb.textColor = UIColor.gray
	
	//텍스트 (중앙) 정렬
	newLb.textAllignment = NSTextAlignment.center
	
	//폰트 크기
	newLb.font = UIFont.systemFont(ofSize: 10)
	
	//Label 화면에 표시하기
	self.newView.addSubview(newLb)
	
	//superView에 종속
	superView.addSubview(newLb)
```

###### UIImageView

```swift
	//객체 생성
	let newIgmV = UIImageView(frame:CGRect(x: 5, y:5, width:90, height: 90))
	
	//이미지 추가
	newImgV.image = UIImage(named:"img.png")
	
	//이미지 설정. 비율에 맞춰 크기 맞추기
	newImgV.contentMode = UIViewContentMode.scaleAspectFit
	
	//이미지 설정. 비율에 맞춰 채우기
	newImgV.contentMode = UIViewContentMode.scaleAspectFill
	
	//이미지 화면에 표시하기
	newView.addSubview(newImgV)
```