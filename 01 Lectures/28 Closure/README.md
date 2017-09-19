# Closure

일단 Closure 문법 외우기!

```swift
{(parameters) -> return type in
	statements
}
```

<br>

#### 일급 객체 (first-class citizens)
> Swift의 함수는 일급 객체

- 일반적으로 다른 객체들에 적용 가능한 연산을 모두 지원하는 객체.
- 함수에 매개변수로 넘기기, 변수에 대입하기와 같은 연산들이 여기서 말하는 일반적인 연산의 예에 해당한다.

<br>

*일급 객체의 조건*
	
- 변수나 데이터 구조안에 담을 수 있다.
- 파라미터로 전당 할 수 있다.
- Return value로 사용할 수 있다.
- 할당에 사용된 이름과 관계없이 고유한 구별이 가능하다.
- Dinamic Property 할당이 가능하다.

<br>

#### 중첩함수
- 함수 내부에서 함수를 정의해 사용되는 함수
- 외부에는 숨겨져 있으며 선언된 함수 내부에서만 호출 가능하다.

```swift
	func chooseStepFunction(backward:Bool) -> (Int) -> Int {
		
		func stepForward(input:Int) -> Int { 
			return input + 1 
		}
		
		func stepBackward(input:Int) -> Int { 
			return input - 1 
		}
		
		return backward ? stepBackward : stepForward
	}
	
	// ? 는 삼항 연산자.
	// backward가 true이면, stepBackward.
	// backward가 false면, stepForward.
```

```swift
	var currentValue = -4
	
	// moveNearerToZero는 변수(전역)
	let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
	
	// moveNearerToZero now refers to the nested stepForward() function
	while currentValue != 0 {
		print("\(currentValue)...")
		currentValue = moveNearerToZero(currentValue)
	}
```

<br>

## Closure
- **Blocks of functionality**, 클로저는 코드에서 전달되고 사용하 룻 있는 독립적인 기능 블록이다.
- **capturable**, 클로저는 정의된 컨텍스트에서 모든 상수 및 변수에 대한 참조를 캡처하고 저장할 수 있다.
- **Global and nested functions**, as introduced in Functions, **are actually special cases of closures.** ...;;

<br>

*클로저의 유형*

- `Global Function`, 이름이 있고 **값을 캡처하지 않는 클로저**.

```swift
	func funcName(argumentName parameter:Type) -> ReturnType {
		statements
	}
```

- `Nested Function`, 이름을 가진 클로저로 내부 함수에서 값을 캡처할 수 있다.

```swift
	func chooseStepFunction(backward: Bool) -> (Int) -> Int {
		func stepForward(input: Int) -> Int { 
			return input + 1 
		}
		
		func stepBackward(input: Int) -> Int { 
			return input - 1 
		}
		
		return backward ? stepBackward : stepForward
	}
```

- `Closure Expressions`, 주변 컨텍스트에서 값을 캡처할 수 있는 간단한 구문으로 작성된 이름없는 클로저.

```swift
{( parameters) -> return type in
	statements
}

//func keyword 사용 X
//funcName 사용 X
//arguments 사용 X
```

<br>

###### ex) Closure

```swift
	self.present(nextVC, animated:true, completion:( () -> void)? )
	
	let alert = UIAlertAction(title: "알럿!",
							style: .default,
							handler: ((UIAkertAction) -> Void)? )	
	UIView.animate(withDuration:0.3
						animations: () -> Void,
						completion: ((Booll) -> void)? )
```

<br>

#### Sorted(by:) 메소드 사용

```swift
	func sorted(by areInIncreaseingOrder: (Element, Element) -> Bool) -> [Element]
```

```swift
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
		
		func backward(_ s1: String, _ s2: String) -> Bool {
			return s1 > s2
		}
		
		//func forward(_ s1: String, _ s2: String) -> Bool {
		//	return s1 < s2
		//}
		
		let sorted = names.sorted(by: backward)
		
		print(sorted)
		//["Ewa", "Daniella", "Chris", "Barry", "Alex"]
		
		//Element는 generic 타입
```

<br>

#### Inline Closure

```swift
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
	
	// 아래 예제 backward(_:_:)는 이전 버전의 함수를 클로저식으로 나타낸 것.
		let sorted = names.sorted(by: {(s1: String, s2: String) -> Bool in
			return s1 > s2
		})
		
		print(sorted)
		//["Ewa", "Daniella", "Chris", "Barry", "Alex"]
	}
```

<br>

#### Closure 간소화
- 1. `Inferring Type From Context`, context에서 return type과 parameter를 간소화 할 수 있다.
- 2. `Implicit Returns from Single-Expression Closure`, single-expression clsure는 return이 내부에 있다.
- 3. `Shorthand Argument Names`, shorthand argument name을 사용한다.

<br>

###### 1. Inferring Type From Context

- s1, s2는 배열(names)에서 가져온 인자이기 때문에 타입을 유추할 수 있다. 또 리턴 결과값으로 인해 리턴의 타입도 유추 가능하다. **즉! 클로저를 함수 또는 메소드에 인라인 클로저 표현식으로 전달할 떄 항상 매개 변수 유형 및 리턴 유형을 유추 할 수 있다.**

```swift
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
	
		// INFERRING TYPE FROM CONTEXT
		let sorted = names.sorted(by: {s1: String, s2: String in return s1 > s2})
		
		print(sorted)
		//["Ewa", "Daniella", "Chris", "Barry", "Alex"]
	}
```

<br>

###### 2. Implicit Returns from Single-Expression Closure
- **클로저 내부 구현부에 리턴내용이 한줄로 단순하게 표시되어 있다면, return 키워드를 생략 가능하다.**

```swift
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
	
		// IMPLICIT RETURN FROM SINGLE-EXPRESSION CLOSURE
		let sorted = names.sorted(by: {s1, s2 in return s1 > s2})
		
		print(sorted)
		//["Ewa", "Daniella", "Chris", "Barry", "Alex"]
	}
```

<br>

###### 3. Shorthand Argument Names
- swift는 인라인 클로저에 자동으로 Shorthand Argument Names를 제공하며, 클로저 인수의 값을 이름 $0, $1 등으로 참조해서 사용할 수 있다.

```swift
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
	
		// SHORTHAND ARGUMENT NAMES
		let sorted = names.sorted(by: { $0 > $1 })
		
		print(sorted)
		//["Ewa", "Daniella", "Chris", "Barry", "Alex"]
	}
```

<br>

###### Trailing Closures
- 함수에 클로저 표현식을 함수의 최종 인수로 전달해야하고 클로저 표현식이 길면 후행 클로저로 작성하는 것이 유용 할 수 있다. Trailing을 사용하면 함수 호출의 일부로 클로저의 인수 레이블을 쓰지 않는다.

```swift
	func someFunctionThatTakesAClosure(closure: () -> Void) {
		// function body goes here
	}
	
	// Here's how you call this function without using a trailing closure:
	
	func someFunctionThatTakesAClosure(closure: {
		// closure's body goes here
	})
	
	// Here's how you call this function with a trailing closure instead:
	
	func someFunctionThatTakesAClosure() {
		// trailing closure's body goes here
	}
```

- 클로저 표현식이 함수 또는 메소드의 유일한 인수로 제공되고, 그 표현식이 후행 클로저로 제공하면, 함수를 호출 할 때 함수 또는 메소드의 이름 뒤에 한 쌍의 괄호를 쓸 필요가 없다.

```swift
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
		
		//TRAILING CLOSURE
		let sorted = names.sorted() { $0 > $1 }
		
		print(sorted)
		//["Ewa", "Daniella", "Chris", "Barry", "Alex"]
	}
```

<br>

###### Operator Method
- swift의 greater-than 메소드(>)의 정의를 보면 두개의 String type 매개변수가 있고, Bool type값을 반환한다. 이것은 Sorted(by:) 메소드에 필요한 메소드 유형과 정확히 일치하므로 greater-than 연산자를 전달하기만 하면 swift는 문자열로 구현하려고 추론을 한다.

```swift
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
		
		//TRAILING CLOSURE
		let sorted = names.sorted() { > }
		
		print(sorted)
		//["Ewa", "Daniella", "Chris", "Barry", "Alex"]
``` 

<br>

###### 예제

```swift
	let add = {(f:Int, s:Int) -> Int in f + s}
	let minus = {(f:Int, s:Int) -> Int in f - s}
	let multify = {(f:Int, s:Int) -> Int in f * s}
	let divide = {(f:Int, s:Int) -> Int in f / s}
	    
	print(calculation(num1: 10, num2: 15, op: add))
	    
	// Trailing Closure for a last parameter
	print(calculation(num1: 1, num2: 2) {$0 + $1})
	    
	print(calculation(num1: 10, num2: 12, op: +))

	//File안에 존재한다고 가정
	//외부 argument 는 _, 외부 parameter는 completion, 타입은 closure인 함수.
	func testActionWithCompletion(_ completion:(Bool) -> Void) {
	
		print("함수 실행")
	    
		//conditino
		if true {
		    
		    completion(true)
		    
		}else {
		    completion(false)
		}
	}
	
	func calculation(num1:Int, num2:Int, op:(Int,Int) -> Int) -> Int {
	return op(num1,num2)
    
}
```

- if 문의 조건에 따라 true일 경우 밑에 함수를 operating한다.

```swift
testActionWithCompletion({(isSuccess) in
	if isSuccess {
		print("Succeeeeeeeeess!!")
	}else {
	    
	}
})
```

<br>

#### Capture

- Closure 안의 모든 상수와 변수에 대한 참조를 캡쳐해서 관리한다.
- Swift는 캡쳐를 위한 모든 메모리를 관리한다.

```swift
	func makeIncrementer(forIncrement amout: Int) -> () -> Int {
		var runningTotal = 0
		
		// 주소값 저장한것을 이 코드가 가지고 있다.
		// var runningTotal = 0 역시 밑의 함수 내부에서 선언 되어있지 
		// 않지만 마찬가지로 주소값을 캡쳐해서 사용한다.
		func incrementer() -> Int {
			runningTotal += amount
			return runningTotal
		}
		return incrementer
	}
```

```swift
	let incrementByTem = makeIncrementer(forIncrement: 10)
	
	incrementByTen()
	// return a value of 10
	incrementByTen()
	// return a value of 20
	incrementByTen()
	// return a value of 30
```

<br>

> *Closure 안에서 사용되는 변수나 함수는 주소값을 참조, 캡쳐(stack에 있는 주소값, Heap에 있는 값이 아님)해서 관리하기 때문에 중첩함수가 된다. -> 함수를 실행시킬때마다 값이 중첩이 됨.*

<br>

#### Map
- map은 mapping이란 단어로 이해
- 컬렉션의 각 항목의 데이터를 다른 데이터로 변경해주는 역할
- 클로저를 이용, 각 항목에 대해 한번 호출되며, 해당 항목에 대해 mapping된 값을 반환한다.(다른 타입도 가능)

```swift
// <T>는 제네릭
	
	let list = [1,2,35,3,5,342,5,235,22]
	let strList = list.map({(num.Int) -> String in 
		return "\(num)"
	})
```

```swift
	let list = [1,2,35,3,5,342,5,235,22]
	let strList = list.map({(num.Int) -> in 
		"\(num)"
	})
```

```swift
	let list = [1,2,35,3,5,342,5,235,22]
	let strList = list.map{"\($0)"}
```

```swift
	//public func map<T>(_ transform: (Element) -> T) -> [T]
	
	let digitNames = [1,2,3,4,5]
	let starList = digitNames.map {(number) -> String in
		var star = ""
		for _ in 0..<number{
			star += "*"
		}
		return star
	}
	print(starList)
```

<br>

#### Filter
- 컬렉션의 특정 아이템을 걸러내는 함수
- 클로저를 통해 걸러내어야 하는 데이터의 조건을 전달해준다.

```swift
	//filter(_ isIncluded: (Element) -> Bool) -> [Element]
	
	let digitNames = [1,2,3,4,5]
	let evenNumbers = digitNames.filter { (number) -> Bool in
		return number % 2 == 0
	}
```

```swift
	let digitNames = [1,2,3,4,5]
	let evenNumbers = digitNames.filter {$0 % 2 == 0}
```

<br>

#### Reduce
- 컬렉션 내부의 모든 콘텐츠의 값을 하나의 값으로 합쳐주는 함수
- 인자를 2개 받으면 첫번째 인자는 초기값, 두번째 인자는 클로저로서 결과값과 각 인자를 합치는 역할을 합니다.
- !(팩토리얼) 같은 문제를 쉽게 풀 수 있다.

```swift
	//reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Bound) -> Result) -> Result
	
	let digitNAmes = 1...10
	let allSum = digitNames.reduce(0) {(num1, num2) -> Int in
		num1 + num2
	}
	
	print(allSum)
```