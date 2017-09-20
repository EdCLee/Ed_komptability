# Notification
> 사용되어야 할 상황을 제대로 인지해서 사용해야 한다.
> 
> Apple Server를 통해 받는다.

<br>

#### NotificationCenter
- 특정 이벤트가 발생 하였음을 알리기 위해 불특정 다수의 객체에게 알리기 위해 사용하는 클래스
- 특정 이벤트가 발생했다는 알림을 받겠다고 Observer로 등록을 해두면 NotificationCenter가 모든 Observer에게 알림을 준다.

<br>

#### Notification 구조

Object A 가 NotificationCenter에 자신이 Notification을 받겠다고 등록(addObserver)하면 Object B가 필요한 시점에 Notification 송출(postNotification)한다. 그러면, NotificationCenter에서 적절한 Object와 Method를 찾아서 호출하게된다.

<br>

#### Notification의 주요 Method

- Initializing

```swift
	open class var `default`: NotificationCenter { get }
```

- Add Observer

```swift
	open func addObserver(_ observer: Any,
							selector aSelector: selector,
							name aName: NSNotification.Name?,
							object anObject: Any?
```

- Post Notification

```swift
	open func post(name aName: NSNotificaation.Name, 
						object anObject: Any?, 
						userInfo aUserInfo: [AnyHashable:Any]? = nil)
```

- Remove Observer

```swift
	open func removeObserver(_ observer:Any)
```

###### 예제

```swift
//OBSERVER
	func observerNoti(noti:Notification) {
		NotificationCenter.default.addObserver(self,
						selector: #selector(ViewController.trackingPost(noti:)),
						name: NSNotification.Name(rawValue: "key"),
						object: nil
	}
	
	func trackingPost(noti:Notification) {
		//noti 내용
	}
```

```swift
//POSTER
	func postNoti() {
		NotificationCenter.default.post(name: NSNotification.Name(rawValue: "key"), 
										object: nil	}
```

<br>
<br>
<br>

###### 읽어보기

- Notification은 NSNotification을 기반으로 만들어진 class이며, 아직까지는 NSNotification으로 사용을 하든, NOtification으로 사용을 하든 문법적으로 문제가 없다.

- typeAlias를 사용하면 NotificationCenter.default.addObserver를 addObserver로 줄여서 사용이 가능하다.

```swift
	typleAlias addObserver = NotificationCenter.default.addObserver
```

- selector를 이렇게도 사용이 가능하나 thread 관련 문제 때문에 사용하지 않는걸 권장한다고 한다. 

```swift
   let btn:UIButton = UIButton()
	btn.addTarget(self, action: #selector(ViewController.btnAction(_:)), for: .touchUpOutside)
```