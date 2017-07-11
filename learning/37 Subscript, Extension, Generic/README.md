# 코드 확장

<br>

## Subscript
- 클래스, 구조체, 열거형의 collection, list, sequence의 멤버에 접근 가능한 단축문법인 Subscript를 정의 할 수 있다.
- Subscript는 별도의 setter/getter없이 index를 통해서 데이터를 설정하거나 값을 가져오는 기능을 할 수 있다.
- Array[index] / Dictionary["Key"] 등의 표현이 Subscript이다.

- **데이터 관리하는데 편하게 사용할 수 있다.**

<br>

#### 문법

```swift
subscript(index: Type) -> Type {
	get {
		// return an appropriate subscript value here
	}
	set(newValue) {
		// perform a suitable setting action here
	}
}
```

```swift
subscript(index: Type) -> Type {
	// return an appropriate subscript value here
}
// 연산 프로퍼티와 문법이 같음.
```

<br>

#### 예제 - Array

```swift
class Friends {
	private var friendNames:[String] = []
	
	subscript(index:Int) -> String {
		get {
			return friendNames[index]
		}
		set {
			friendNames[index] = newValue
		}
	}
}

let fList = Friends()
fList[0] = "Ed"
```

<br>

#### 예제 - struct

```swift
struct TimesTable {
	let multiplier:Int
	subscript(index:Int) -> Int {
		return multiplier * index
	}
}

let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")
```

<br>

#### 예제 - 다중 parameter

```swift
struct Matric {
	let grid:[Double]
	init(rows:Int, columns:Int) {
		self.rows = rows
		self.columns = columns
		grid = Array(repeating: 0.0, count: rows * columns)
	}
	
	subscript(row:Int, column:Int) -> Double {
		get {
			return grid[(row * columns) + column]
		}
		set {
			grid[(row * columns) + column] = newValue
		}
	}
}

var matrix = Matrix(rows:2, coulemns:2)
matrix[0,0] = 1
matrix[0,1] = 2.5
```

<br>

## Extension
- Extensions 기능은 기존 클래스, 구조, 열거 형 또는 프로토콜 유형에 새로운 기능을 추가합니다.
- Extensions으로 할 수 있는 것은
	- Add computed instance properties and computed type properties.
	- Define instance methods and type methods.
	- Provide new initializers.
	- Define subscripts.
	- Define and use new nested types.
	- Make an existing type conform to a protocol.

<br>

#### 문법

```swift
extension SomeType {
	// new functionality to add to SomeType goes here
}

extension SomeType: SomeProtocol, AnotherProtocol {
	// implementation of protocol requirements goes here
}
```

<br>

#### 유형 - Computed Properties

```swift
extension Double {
	var km: Double { return self * 1_000.0 }
	var m: Double { return self }
	var cm: Double { return self / 100.0 }
	var mm: Double { return self / 1_000.0 }
	var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
// Prints "One inch is 0.0254 meters"

let threeFeet = 3.ft
// Prints "Three feet is 0.91439997073901 meters"
```

<br>

#### 유형 - init

```swift
extension Rect {
	init(center: Point, size: Size) {
		let originX = center.x - (size.width / 2)
		let originY = center.y - (size.height / 2)
		self.init(origin: Point(x: originX, y:originY), size: size)
	}
}
```

<br>

#### 유형 - method

```swift
extension Int {
	func repetitions(task: () -> Void) {
		for _ in 0..<self {
			task()
		}
	}
}

3.repetitions {
	print("Hello")
}
// Hello
// Hello
// Hello
```

<br>

#### 유형 - mutating method

```swift
extension Int {
	mutating func square() {
		self = self * self
	}
}

var someInt = 3
someInt.square()
```

<br>

#### 유형 - Subscript

```swift
extension Int {
	subscript(digitIndex: Int) -> Int {
		var decimalBase = 1
		for _ in 0..<digitIndex {
			decimalBase *= 10
		}
		return (self / decimalBase) % 10
	}
}

746381295[0]
// returns 5

746381295[1]
// returns 9

746381295[2]
// returns 2

746381295[8]
// returns 7
```

<br>

#### 유형 - Nested Types

```swift
extension Int {
	enum Kind {
		case negative, zero, positive
	}
	var kind: Kind {
		switch self {
		case 0:
			return .zero
		case let x where x > 0:
			return .positive
		default:
			return .negative
		}
	}
}
```

<br>

## Generic
- 어떤 타입에도 유연한 코드를 구현하기 위해 사용되는 기능.
- 코드의 중복을 줄이고, 깔끔하고 추상적인 표현이 가능하다.

<br>

#### 사용목적

```swift
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
	let temporaryA = a
	a = b
	b = temporaryA
}

// 두 Int를 받아 서로 바꿔주는 스왑함수가 있다.
// Int 외에도 Double, String등 다양한 타입의 데이터를 스왑한다면?
```

- Any를 사용하면 여러가지 타입을 처리할 수 있겠지만 값의 타입이 바뀔수 있으므로 적절하지 않다.

<br>

#### Generic을 사용한 swap 함수

```swift
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
	let temporaryA = a
	a = b
	b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoValues(&someInt, &anotherInt)
// someInt is now 107, and anotherInt is now 3

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)
// someString is now "world", and anotherString is now "hello".
```

<br>

#### Framework 확인

```swift
        let list = Array<Int>()
        // Array가 Generic이기 때문에 타입을 지정해 주어야 한다.
        
        let list2:[Int] = []
        
        //let list3:Array<Int> = ()
        //let list4 = Array<Int>()
        
        //let list5 = []
        
        let strList:[String] = []
        
//        list2.sorted { (Int, Int) -> Bool in
//            code
//        }
//        
//        strList.sorted { (String, String) -> Bool in
//            code
//        }
        
//        list2.map { (Int) -> T in
//            code
//        }
```

<br>

#### Type Parameters
- Generic 사용된 "T"는 타입의 이름으로 사용되었다기 보다는 placeholder 역할로 사용되었다.
- 타입은 꺽쇠<> 로 감싸 표시한다.
- 타입의 이름은 보통 사용되는 속성에 맞게 네이밍 할 수 있으나 아무런 연관이 없는 타입의 경우에는 T, U, V같은 알파벳으로 사용된다.

<br>

###### 예제 - Generic 만들기 : stack

```swift
struct IntStack {
    var items = [Int]()
    
    mutating func push(_ item:Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
}


// Generic version.
struct GenericStack<T> {
    var items = [T]()
    
    mutating func push(_ item: T) {
        items.append(item)
    }
    
    mutating func pop() -> T {
        return items.removeLast()
    }
}
```