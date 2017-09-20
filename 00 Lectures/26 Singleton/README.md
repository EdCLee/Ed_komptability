# Singleton Pattern
> Design Pattern 일뿐, 문법같은게 아니므로 공식문서에서 조회할 수 없다!

## Singleton?
- 어플리케이션 전 영역에 걸쳐 하나의 클래스의 단 하나의 인스턴스(객체)를 생성하는 것을 싱글톤 패턴이라 한다.
- 어플리케이션 내부에서 유일하게 하나만 필요한 객체에서 사용(셋팅, 데이터 등)
- Type property에 1개의 인스턴스만 저장해서 사용한다.
- 앱 내에서 공유하는 객체를 만들 수 있다.

<br>

#### Singleton Pattern 인스턴스 만들기

```swift
class SingletonClass {
	//MARK: shared Instance
	static var sharedInstace:SingletonClass = SingletonClass()
	
	// Can't init is singleton
	private init() {
	//초기화가 필요하면 private으로 생성
	}
```

<br>

#### Singleton Pattern 예제

```swift
// 스크린 정보를 가지고 있는 객체
let screen = UIScreen.main
// open class var main: UIScreen { get }

// 사용자 정보를 저장하는 객체
let data = UserDefaults.standard

// 어플리케이션 객체
let app = UIApplication.shared

// 파일 시스템 정보를 가지고 있는 객체
let fileManager = FileManager.default
```


###### method?

```swift
class SampleClass {
	class func typeMethod2DaToOverride() {
	}
	
	static func typeMethod2Da() {
	}
	
	func instanceMethod2Da() {
	}
}
```

- 프로그램 전체에 영향을 주는 설정값등은 싱글톤으로 쓰면 좋다.