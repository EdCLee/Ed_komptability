# Thread
> thread를 que라고도 한다.

- `thread`는 프로세스 내에서 실행되는 흐름의 단위를 말한다. 일반적으로 한 프로그램은 하나의 스레드를 가지고 있지만, 프로그램 환경에 따라 둘 이상의 스레드를 동시에 실행할 수 있다. 이러한 실행 방식을 `multithread`라고 한다.

<br>

## iOS Thread
- 모든 app은 기본적으로 **main thread**를 가지고 있다.
- use UIKit classes only from your app's main thread.
- 기본적인 UI 및 모든 행동은 main thread에서 실행된다.

<br>

#### 언제 사용하나요!?
- 동시에 작업이 필요한 경우
- multi core process를 사용하기 위해
- 중요한 작업에 방해를 받지 않기 위해
- 상태를 계속 감시 해야 할 경우가 필요할 때

<br>

#### Multi thread 사용 예
- Network request/response
- time control
- imgae download/upload
- long time actions

- 비동기

<br>

#### 동기/ 비동기 방식
- 동기(Asynchronous: 동시에 일어나지 않는, 같은 시기가 아닌)
- 비동기(Synchronous: 동시에 일어나는, 같은 시기)

- 디자인패턴에 의한 비동기처리는 다음과 같은 것들이 있다.
	- **delegate, @selector, block, Notification**
- 큐를 이용한 비동기 처리 방법은 GCD로 가능하다.
	- dispatch_sync(...), dispatch_async(...) // `objective-c` 소스

<br>

#### 교착상태(deadlock)
- 교착상태란 두개 이상의 작업이 서로 상대방의 작업이 끝나기 만을 기다리고 있기 때문에 결과적으로 아무것도 완료되지 못하는 상태를 가리킨다.

- Atomic 옵션으로 교착상태를 해결할 수 있다.

<br>

#### iOS MultiThread 방법
- Thread: 직접 thread를 만들어서 제어하는 방식
- GCD: Closure 기반의 기법으로 코드 가독성이 좋고 간편하다.
- Operation: GCD 기반의 wrapper Class. 간단하게 사용가능하고 고수준의 API를 제공한다. 성능이 느린편
- performSelector: Selector를 이용한 방식, ARC 이전에 주로 사용한 방식이였으나 GCD 이후엔 많이 사용되진 않는다.
- Timer: 간단한 interval Notification를 제공해 주는 Class. 특이하게도 **Timer는 mainLoop**에서 실행된다.

<br>

## GCD(Grand Central Dispatch)
- 비동기로 여러작업을 수행시키는 강력하고 쉬운 방법이다.
- System에서 Thread 관리를 알아서 해준다.
- dispatch queue를 이용해 작업들을 컨트롤 한다.
- work item: Closure를 활용해서 구현되어 있으며 queue를 생성할때 꼭 같이 만들어야 한다.

<br>

#### DispatchQueue
- dispatch queue는 GCD의 핵심으로 GCD로 실행한 작업들을 관리하는 queue이다.
- 모든 dispatch queue는 first-in, first-out 데이터 구조이다.
- 직렬(Serial Queue)와 병렬(Concurrent Queue) 2종류로 나눌 수 있다.

<br>

#### init

```swift
public convenience init(label: String,
						qos: DispatchQos = default,
						attributes: DispatchQueue.Attributes = default,
						autorekeaseFrequency: DispatchQueue.AutoreleaseFrequency = default,
						tartget: DispatchQueue? = default()

let queue = DispatchQueue(label: "com.wing.queue")
let queueOption = DispatchQueue(label: "com.wing.queue1", qos: .userInitiated)
let queueAttri = DispatchQueue(label: "com.wing.queue2", attributes:[.concurrent, initiallyInactive])
```

<br>

#### async

```swift
let queue = DispatchQueue(label: "com.wing.async")
queue.async {
}
```

<br>

#### Quality Of Service(QoS) and Priorities
```
userInteractive		//우선순위 상 
userInitiated
default
utility
background
unspecified			//우선순위 하
```

```swift
public struce DispacthQoS : Equatable {
	public let relativePriority: Int
	public static let background: DispatchQoS
	public static let utility: DispatchQoS
	public static let `default`: DispatchQoS
	public static let userInitiated: DispatchQoS
	public static let userInteractive: DispatchQoS
	public static let unspecified: DispatchQoS
```

```swift
let q2 = DispatchQueue(label: "com.closureExample.q2", qos: .userInteractive)
        let q3 = DispatchQueue(label: "com.closureExample.q3", qos: .userInitiated)
        let q4 = DispatchQueue(label: "com.closureExample.q4", qos: .default)
        let q5 = DispatchQueue(label: "com.closureExample.q5", qos: .utility)
        let q6 = DispatchQueue(label: "com.closureExample.q6", qos: .background)
        let q7 = DispatchQueue(label: "com.closureExample.q7", qos: .unspecified)
        
        //userInteractive
        q2.async {
            for n in 200..<300 {
            print("\(n) : userInteractive")
            }
        }
        
        //userInitiated
        q3.async {
            for n in 300..<400 {
            print("\(n) :  userInitiated")
            }
        }
        
        //default
        q4.async {
            for n in 400..<500 {
            print("\(n) :   default")
            }
        }
        
        //utility
        q5.async {
            for n in 500..<600 {
            print("\(n) :    utility")
            }
        }
        
        //background
        q6.async {
            for n in 600..<700 {
            print("\(n) :     background")
            }
        }
        
        //unspecified
        q7.async {
            for n in 700..<800 {
            print("\(n) :      unspecified")
            }
        }
```

<br>

#### Attributes

```swift
public struct Attributes: OptionSet {
	public static let concurrent: DispatchQueue.Attributes
	public static let initiallyInactive: DispatchQueue.Attributes
}
```

- Default = 직렬
- concurrent = 병렬
- initiallyinactive = 태스크 수동 실행(activate() 메소드)

<br>

#### Main dispatch queue
- Main Thread를 가르키며 기본 UI를 제어하는 queue이다.
- Serial 방식으로 들어온 순서대로 진행되며 앞에 작업이 종료될 떄까지 뒤의 작업들은 대기 한다.
- 생성

```swift
	DispatchQueue.main.async {
		// Do something
	}
```

<br>

#### Global dispatch queue
- app 전역에 사용되는 queue로서 Concurrent 방식의 queue이다.
- option으로 qos를 설정 할 수 있다.
- 생성

```swift
let globalQueue = DispatchQueue.global()
let globalQueue = DispatchQueue.global(qos: .userInitiated)
```

<br>

#### DispatchWorkItem
- 실행 할 수 있는 작업의 캡슐화
- 이벤트를 등록, 취소 할 수 있다.
- dispatchQueue에서 실행 시킬 수 있다.

```swift
public init(qos: DispatchQos = default,
			flags: DispatchWorkItemFlags = default,
			block: @escaping @convention(block) () -> Swift.Void)
```

<br>

#### DispatchWorkItem example

```swift
func useWorkItem() {
	var value = 10
	let workItem = DispatchWorkItem {
		value += 5
	}
	
	workItem.perform()
	
	let queue = DispatchQueue.global(qos: .utility)
	queue.async(execute: workItem)
	workItem.notity(queue: DispatchQueue.main) {
		print("value = ", value)
	}
}
```

<br>

## Timer

```swift
let delayQueue = DispatchQueue(label: "com.wing.delayqueue", qos: .userInitiated)

print(Date())

let additionTime: DispatchTimeInterval = .seconds(2)

delayQueue.asyncAfter(deadline: .mow() + additionalTime {
	print(Date())
}

delayQueue.asyncAfter(deafline: .now() + 0.75) {
	print(Date())
}
```