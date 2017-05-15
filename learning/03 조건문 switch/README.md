## 이전 내용 정리

- 객체 지향형 프로그래밍이란?

	- 컴퓨터 프로그래밍의 한 패러다임이다. 컴퓨터 프로그래밍을 명령어의 목록으로 보는 시점에서 벗어나 `여러개의 객체들의 모임`으로 추상화를 통해 실세계를 모델링 하고자 하는 것이다. 간단하게 객체 위주로 프로그래밍을 하는것이라고 할수 있다.

		- 구성요소 

		- `클래스(Class)` : 표현 대상들의 공통적인 특징을 서술(추상화)한 것. 그러한 특징들을 method나 
		- `객체(Object)` : 클래스의 인스턴스로 클래스라는 일종의 설계도를 기반으로 실제로 생성된 그 실체가 객체이다. 
		- `메서드(Method)와 메시지(Message)` : 클래스로부터 생성한 객체를 사용하는 방법으로 객체에 명령을 내리는 행위라고 할 수 있다. 메서드는 속성을 조작하는데 사용이 되며 메시지는 객체간 통신이 이루어지는 방법이다. 이 메시지를 통해 메소드가 호출되어 사용된다.

		- 지향의 특징

		- `추상화(Abstaction)` : 객체에서 공통된 속성과 행위를 추출,정의 하는 것.
		- `캡슐화(Encapsulation)` : 정보은닉이라고도 하며, 관련있는 것을 묶어서 이름을 부여하는 것. 
		- `상속(Inheritance)` : 추상화를 통해 설계된 클래스에 다른 특성을 추가해 새로운 클래스를 만들 수 있다.
		- `다형성(Polymorphism)` : 상속성의 계층을 따라서 각각의 클래스에 한가지 이름을 줄 수 있는 것.

- 클래스와 객체의 차이점
	- 클래스는 하나의 속성이나 행위를 정의하게 되며 객체와의 관계는 추상적인 개념인 클래스와 실제 존재하는 사물이라는 차이가 있다. 클래스가 도면이라면 객체는 집.

- Xcode 사용법
	- 링크테우고 단축키 정리. 

- 명명법
	- `class`명은 **PascalCasing**으로 선언 하고, `var`나 `let` 또는 `func`는 선언할 때에는 **camelCasing**으로 선언한다.
	- <kbd>space bar</kbd>를 입력하면 안된다. ex) `space Bar` X
	- 숫자는 이름으로 시작될 수 없지만 이름에 포함은 가능하다. ex) `numberInName2` O
	- 시스템 예약어를 사용하면 안된다.
- 변수: 문법, 변수의 타입
	- 문법: `variable variableName:Type = value`로 작성. -> `var varName:Type = value`
	- 타입: 

		|이름|타입|설명|문법|
		|---|---|---|---|
		|정수|`Int`|1, 2, 3, 10, 100|`var intName:Int`|
		|실수|`Double`|1.1, 2.35, 3.2|`var doubleName:Double`|
		|문자열|`String`|"this is string"|`var stringNAme:String`|
		|불리언|`Bool`|true or false|`var boolName:Bool`|
		|참조형|`ClassName`|클래스 객체를 다른곳에서 사용할 경우|`let custromView:UIView`<br>`let timer:Timer`|
- 함수: 문법, if - else 문
		
	```swift
		//문법 예제 1
		func plus(inNumber num1:Int, num2:Int) -> Int {
			var plus:Int = 0 //함수이름과 변수이름이 같으면 안된다.
			plusFunc = num1 + num2
			return number	
			// 간결하게 작성하면
			// var plusFunc:Int = num1 + num2
			// return plusFunc
			
			// 더 간결하게
			// return num1 + num2
		}		 
	```
<br>
<center>**swift는 간결하게 작성하는걸 추천한다.**</center>
<br>
--

# 조건문

## Switch 문
> 패턴 비교문
> 
> 가장 첫번째 매칭되는 패턴의 구문이 실행된다.

```swift
switch some value to consider {
	case 	value 1:
			respond to value 1
	case 	value 2,
			value 3:
			respond to value 2 or 3
	default:
			otherwise, do something else
```

#### switch 문법
- 각 `case` 키워드를 통해 상태를 나타낼 수 있다.
- 각 `case` 상태 끝에는 콜론을 작성해서 매칭 패턴을 종료한다.
- 여러개의 `case`가 필요하면 콤마를 통해 상태를 추가 할 수 있다.
- 각 case는 분기로 실행되며 매칭된 해당 `case`문이 종료되면 `switch`문을 종료시킨다. break
- 각 `case`의 상태는 `switch` 문의 `value`값에 매칭된 지점을 결정하며, 모든 `value`에 대해 매칭되어야 한다. 만약 매칭되는 값이 없다면 `default` 키워드를 통해 기본 매칭값을 설정하며, `default` 키워드는 마지막에 배치된다.
- 모든 Type에서 사용 가능하다.

###### switch 예제
```swift
	func sampleSwitch(someCharacter:Character) {
		switch someCharacter {
		case "a":
			print("The first letter of the alphabet")
		case "z":
			print("The last letter if the alphabet")
		default:
			print("some other character")
		}
	}
```

#### Interval Matching
> `switch`문의 상태는 단순 `value`매칭을 넘어 좀더 다양한 패턴을 통해 매칭이 가능하다.
>
> `interval matching`은 **범위 연산자**를 통해 해당 범위에 해당하는 `value`를 매칭 시킬 수 있다.

```swift
func grade(fromPoint point:UInt) -> String {
    var gradeValue:String = "F"
    
    switch point {
    case 95...100:	//범위연산자 a...b
        gradeValue = "A+"
    case 90..<95:	//범위연산자 a..<b
        gradeValue = "A"
    default:
        gradeValue = "F"
    }
    return gradeValue
}
```

#### 튜플매칭
> `튜플`을 사용해서 여러개의 `value`를 동시에 확인 할 수 있다.
>
> 사용 가능한 모든 값에 대한 매칭은 `와일드카드(_)`를 통해서 매칭 가능.

###### 튜플예제
```swift
func getPoint(somePoint:(Int, Int)) {
	switch somePoint {
	case (0, 0):
		print("\(somePoint) is at the origin")
	case (_, 0):
		print("(\(x), \(y)) is on the x-axis")
	case (0, _):
		print("(\(x), \(y)) is on the y-axis")
	case (-2...2, -2...2):
		print("(\(x), \(y)) is inside the box")
	defualt:
		print("(\(x), \(y)) is outside the box")
```

#### 값 바인딩
> `case` 내부에서 사용되는 임시 값으로 매칭 시킬 수 있다.
>
> 예제의 `let x`, `let y` 처럼 값을 바인딩 한다.

###### 값 바인딩 예제
 ```swift
 func getPoint(somePoint:(Int, Int)) {
 	switch somePoint {
 	case (0, 0):
 		print("\(somePoint) is at the origin")
 	case (let x, 0):
 		print("on the x-axis with an x value of \(x)")
  	case (0, let y):
 		print("on the y-axis with an x value of \(y)")
 	case (-2...2, -2...2):
 		print("\(somePoint) is inside of the box")
 	default:
 		print("\(somePoint) is outside of the box")

 ```

#### where문
> `where` 문의 추가로 추가 조건을 넣을 수 있다.
>
> `switch` 문에 값을 바인딩하고서 사용할 수 있다.

###### where문 예제
```swift
func wherePoint(point:(Int,Int)) {
	switch point {
	case let (x, y) where x == y:  //where 조건문
		print("(\(x), \(y)) is on the line x == y")
	case let (x, y) where x == -y:
		print("(\(x), \(y)) is on the line x == -y")
	case let (x, y):
		print("(\(x), \(y)) is just some arbitarary point")
	}
}
```
