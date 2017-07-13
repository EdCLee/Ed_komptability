# Thread
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
