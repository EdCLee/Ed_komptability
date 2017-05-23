# Application Life Cycle

> `viewDidLoad`가 실행되기 전에 벌어지는 일들에 관해..

## The Main Run Loop
하나의 가장 중요한 `main loop`를 `메인 thread`라고 한다. `Event Queue`가 실행될때 처리하는 역할.

<br>

#### Event에 대한 처리
- Touch : 발생된 이벤트에 대한 뷰 처리
- Remote control & Shake motion events : `First Responder` 객체
- Accelerometer/Magnetometer/Gyroscope : 각각의 객체로 전달
- Location : `CoreLocation` 객체
- redraw : 업데이트를 원하는 뷰 처리

<br>

#### Excution States for Apps
- Not Running : 실행되지 않은 상태 
- Inactive : 실행되고 있지만 Home 버튼으로 내려놓은 상태(?)
- Active : 실질적으로 활동하고 있는 상태
- Background : 백그라운드에서 실질적으로 동작을 하는 상태. 음악실행이나 걸어온 길 트래킹하는 동작 등.
- Suspended : 백그라운드에서 실행될때 실질적으로 Active되고 있는 앱이 메모리 부족으로 백그라운드에서 실행되는 앱을 Terminate 시키게 되는 것.

<br>

#### Supported Background Tasks
- Audio and AirPlay
- Location updaates
- Voice over IP
- Newsstand downloads
- External accessory communication
- Bluetooth LE accessories
- Background fetch
- Remote notifications (PushNotification)

<br>

#### UIViewController의 생명주기 메소드
- **프로그래머가 직접 호출 불가!**
- 오버라이드하는 메소드이므로 꼭 해당 메소드 내에서 `super`를 통해 상위 메소드를 꼭 호출해야 된다.

```swift
    // override. 부모에 있는 메소드 override

	//UIViewController의 view가 생성될 때 호출
	override func loadView()
	
	//UIViewController가 인스턴스화 된 직후 호출.
	//처음 한번 세팅해줘야 하는 값들을 넣기에 적절.
	override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //view가 화면에 보여지기 직전에 호출.
    //화면이 보여지기 전에 준비할 떄 사용.
    //animated 파라미터는 뷰가 애니메이션을 동반하여 보여지게 되는지
    //시스템에서 전달해주는 불리언 값.
    override func viewWillAppear(_ animated: Bool) {
        // 부모에 있는 메소드 호출
        super.viewWillAppear(animated)
    }
    
    //view의 하위뷰들의 레이아웃이 결정되기 직전 호출
    override func viewWillLayoutSubviews() {
        
    }
    
    //veiw의 하위 뷰들의 레이아웃이 결정된 후 호출
    //주로 view의 하위뷰들이 사이즈 조정이 필요할 때 호출
    override func viewDidLayoutSubview() {
    
    }
    
    //view가 화면에 보여진 직후에 호출. 
    //화면이 표시된 이후 애니메이션 등을 보여주고 싶을때 유용
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    //view가 화면에서 사라지기 직전에 호출
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    //view가 화면에서 사라진 직후에 호출
    override func viewDidDisappear(_ animated: Bool) {
        
    }
```
- 원하는 Action의 효과 시점에 따라 사용할 적절하게 사용해야 함.

-

<br>
<br>
<br>

# 접근제어
> 외부 모듈에서의 접근을 제어하는 수단
> 
> 캡슐화, 은닉화를 위해 사용

<br>

#### 모듈 & 소스파일
- 모듈: `package`, `project`, `framework` 처럼 하나의 큰 일관된 덩어리.
- 소스파일: `.swift` 파일 하나를 소스코드 파일이라 한다.

<br>

#### 접근제어
- `open`: 모듈 외부까지 접근 가능한 **개방 접근수준**.
- `public`: 모듈 외부까지 접근 가능한 **공개 접근수준**.
- `internal`: 모듈 내부에서 접근 가능한 **내부 접근수준**. `Default`값
- `fileprivate`: 파일 내부에서만 접근가능한 **파일외 비공개**.
- `private`: 기능 정의 내부, 하나의 class, enum, structure에서만 가능한 **비공개 접근수준**. 

###### fileprivate vs private

```swift
	//같은 프로젝트 내 다른 클래스에서도 접근 불가.
	//같은 class내 extension에서는 사용 가능.
	class SampleClass {
		fileprivate var name:String = "Ed"
	}
	
	//외부에서 클래스 접근조차 불가능
	//같은 class내 extension을 사용해도 사용 불가.
	private class SampleClass {
		var varName:String = name
	}
```

###### Open vs Public
- Open을 제외한 다른 접근수준의 클래스는 그 클래스가 정의된 모듈 안에서만 상속될 수 있다.
- Open을 제외한 다른 접근수준의 클래스 멤버는 그 멤버가 정의된 모듈 안에서만 재정의 될 수 있다.
- Open 수준의 클래스는 그 클래스가 정의된 모듈 밖의 다른 모듈에서도 상속되고 재정의 될 수 있다.
- 클래스를 Open으로 명시하는 것은 그 클래스를 다른 모듈에서도 부모 클래스로 사용할 수 있다.