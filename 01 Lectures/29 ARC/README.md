# ARC
> Auto Reference Counting

<br>

#### 메모리 관리 방식
- `명시적 해제` : Counting 이라는 것을 이용해서 개발자가 관리하는 것.
- `Garbage Collector` : 가비지 콜렉터가 수시로 확인해서 안쓰는 객체를 해제 시킴(시스템 부하).
- `Reference Counting` : 오너쉽 정책에 의해 객체의 해제 정의.

<br>

###### `메모리 관리 방식`에 대해 이해하려면 `Objective-C`를 한번 쯤 봐둘 필요가 있다.

```objective-c
	//Objectice-C 에서 사용하는 명시적 해제 방식

	// str1을 생성하면서 리테인 카운팅이 +1 되면서 생성.
	NSString *str1 = [[NSString alloc] init];
	// retain을 사용하면서 str2에 오너쉽을 부여.
	// str2의 오너쉽때문에 메모리에 +1 추가
	NSString *str2 = [str1 retain];
	// str2의 메모리 주소값을 참조. 
	NSString *str3 = str2; 
	
	[str1 release];
	[str2 release];
	// str1, 2가 release 되면서 str2를 참조만 하던 str3는
	// 자동으로 사라지게 됨.
	
	-(id)init {
		retainCount = 1;
	}
	
	-(id)retain {
		retainCount += 1;
		return self;
	}
	
	-(void)init {
		retainCount -= 1;
		if(retainCount == 0)
		 [self dealloc];
	}
```

<br>

```objectice-c
	// str1 생성(얼록 이닛!)
	NSString *str1 = [[NSString alloc] init];
	// str2 생성
	NSString *str2 = [[NSString alloc] init];
	// str3 생성
	NSString *str3 = [[NSString alloc] init];
	
	// str2를 생성하면서 위에 선언된 *str2는 여기서 선언된 str2의 메모리 주소값을 참조함.
	str2 = [[NSString alloc] init];
	
	// str1, 2, 3을 release 해도 위에 위에 str2의 메모리는 앱이 죽을때까지 남아있게 됨.
	[str1 release];
	[str2 release];
	[str3 release];
	
	// 메모리 leaking! 현상
```

<br>

#### Ownership Policy
- 인스턴스 객체의 오너만이 해당 인스턴스의 해제에 대해서 책임을 진다.
- 오너쉽을 가진 객체만 reference count가 증가 된다.

<br>

## ARC

#### WWDC 2011

###### ARC는 기존 메모리 관리 방식의 어려움을 개선하고자 WWDC 2011에서 공개 되었다.

- Memory Management is Harder than It Looks...
	- Instruments
		- Allocations, Leaks, Zombies
	- Xcode Static Analyzer
	- Heap
	- ObjectAlloc
	- MallocScribble
	- debugger watchpoints
	- ...and lots more 

###### 앱의 비정상 종료 원인 중 많은 부분이 메모리문제로 메모리관리는 애플의 앱 승인 거부(Rejection)가 대다수 원인 중 하나였다. 많은 개발자들이 수동적인 (retain/ release) 메모리 관리로 힘들어 했다. retain/release로 코드 복잡도가 증가.

- Welcome to ARC!
	- Automatic Object memory management
		- Compiler synthesizes retain/release calls
		- Compiler obeys and enforces library conventions
		- Full interoperability with retain/release code
	
	- New rentime features:
		- Zeroing weak pointers
		- Advanced performance optimizations
		- Compatibility with Snow Leopard and iOS4

###### ARC는 Automatic Reference Counting의 약자로 기존에 수동(MRC라고 함)으로 개발자가 직접 retain/release를 통해 reference counting을 관리해야 하는 부분을 자동으로 해준다.

- What ARC Is Not...
	- No new runtime memory model
	- No automation for malloc/free, CF, etc
	- No garbage collector
		- No heap scans
		- No whole app pause
		- No non-deterministic release

<br>

#### ARC 규칙
- retain, release, retainCount, autorelease, dealloc 을 직접 호출 할수 없다.
- 구조체내의 객체 포인트를 사용할 수 없다.
- id나 void * type을 직접 형변환 시킬 수 없다.
- NSAutoreleasePool 객체를 사용할 수 없다.

<br>

#### 새로운 지시어
- Strong
	- ownership을 가지고 있다. 즉 할당이 될 떄마다 reference count가 증가 된다.
- weak
	- ownership이 없는 weak reference count가 0.
	- 태생적으로 옵셔널이다.

<br>

###### strong 객체 선언

```objective-c
@property(strong) Person *p1;
@property(strong) Person *p2;

// 할당
p1 = [[Person alloc] init];
```

```swift
var p1:Person
var p2:Person

p1 = Person()
```

###### weak 객체 선언

```objective-c
@property(strong) Person *p1;
@property(weak) Person *p2;

p1 = [[Person alloc] init];
```

```swift
var p1:Person
weak var p1:Person

p1 = Person()
```

<br>

###### weak pointer 사용 이유
- 순환 참조를 막기위해
- Autorelease pool을 대신해서 자동 해제가 필요한 경우
- view의 strong 참조 때문에

<br>

#### Unowned Keyword
> `weak`가 항상 옵셔널이기 때문에 때에 따라 `unowned`를 사용하기도 한다.

- weak와 마찬가지로 unowned가 참조하는 인스턴스를 강력하게 보류하지 않는다.
- unowned keyword를 프로퍼티나 변수 앞에 선언하여 표시해준다.
- unowned는 항상 값이 있다는 것을 의미한다.

<br>

#### Closure 캡쳐
- 클로져 안의 모든 상수와 변수에 대한 참조를 캡쳐해서 관리한다.
- swift는 캡쳐를 위한 모든 메모리를 관리한다.

```swift
	func makeIncrementer(forIncrement amount: Int) -> () -> Int {
		var renningTotal = 0
		func incrementer() -> Int {
			renningTotal += amount
			return renningTotal
		}
		return incrementer
	}
```

```swift
	let incrementByTen = makeIncrementer(forIncrement:10)
	
	incrementByTen()
	//returns a value of 10
	incrementByTen()
	//returns a value of 20
	incrementByTen()
	//returns a value of 30
```