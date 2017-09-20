# 클래스와 구조체

## Classes & Structures
- 프로그램 코드 블럭의 기본 구조.
- `var`, `let`, `func`를 추가 할 수 있다. 문법구조가 같음.
- 초기상태 설정을 위해 initializer가 만들어지고 사용자가 추가로 정의 할 수 있다.
- 사용시 인스턴스(Instance)라고 불린다.
- `Extensions`가 가능하다.
- `Protocols`을 채택해서 사용 가능하다.
- import할 필요없이 다른 코드에서 자동으로 사용할 수 있으며, 접근제한자에 따라 접근성은 달라진다.

#### 기본구조

```swift
class SomeClass {
	//class definition goes here
}

struct SomeStructure {
	//structure definition goes here
}
```

<br>

###### 기본구조 예제

```swift
struct Resoultion {
	var width = 0
	var height = 0
}

class VideoMode {
	var resolution = Resolution()
	var interlaced = false
	var grameRate = 0.0
	var name:String?
}

//MARK: 인스턴스
let someResolution = Resolution()
let someVideoMode = VideoMode()

//MARK: Properties 접근
//(.) 문법을 통해 접근
print("Width of Resolution is \(someResolution.width)")
print("Width of VideoMode is \(someVideoMode.resolution.width)")
someVideoMode.resolution.width = 1280
```

- `struct` 는 `class`에 `property`를 만들 수 없다.
- `class`는 `struct`를 가지고 `property`를 만들 수 있다.

<br>

## Initialization

#### 초기화
- 인스턴스에 설정된 속성의 초기값으로 설정.
- 클래스와 구조체는 인스턴스로 만들어질때 프로퍼티는 초기값으로 모두 초기화 해야 한다.
- **모든 구조체**는 자동으로 Memberwise Initializers가 만들어 진다. 클래스는 해당사항 없음.

#### Base Initializers

```swift
//MARK: Struct
struct Book {
    // 자동으로 memberwise initializers가 만들어져서
    // 필요에 따라 custom initialize를 할 필요가 없다.
    var name:String
    var cost:Int
    var isbn:UInt
}

//MARK: Class
// custom initialize를 한다.
// init()을 추가하거나 변수에 초기값을 설정해주지 않으면 에러 발생
// name과 address는 init()을 주고, books는 초기값 = [] 을 줌.
class BookStore {
    var books:[Book] = []
    var name:String
    var address:String

    init(name:String, address:String) {
        self.name = name
        self.address = address
    }
        
    func addBook(name:String, cost:Int){
        let book:Book = Book(name:"스위프트 따라잡기", cost:10000, isbn:UInt(books.count + 1))
        self.books.append(book)
    }
}
```

<br>

#### Custom Initalizers

```swift
class Student {
	var Subjects:[Subject] = []
	
	func addSubject(name:String) {
		var sub1:Subject = Subject(gender:true)
		sub1.name = "Ed"
		sub1.age = 31
		subjects.append(sub1)
	}
}

struct Subject {
	var name:String?
	var age:Int?
	var gender:Bool
	
	// memberwise 대신 custom을 사용해서 
	// class Student에서 사용 할 수 있도록 함.
	init(gender:Bool) {
		self.gender = gender
```

## Classes VS Structures
||Class|Struct|
|:---:|:---:|:---:|
|**타입**|참조|값|
|**상속**|O|X|
|**Type Casting(down)**|O|X|
|**Reference Counting**|O|X|
|**instance 수정**|var, let|var|
|**deinitializer**|O|X||

- 참조와 값타입의 차이 비교.

<br>

## memory 구조 파악하기

|메모리영역|설명|
|:---:|---|
|**STACK**|지역변수, 매개변수 등|
|**HEAP**|동적 할당을 위한 영역|
|**DATA**|전역 변수, 정적변수가 저장|
|**CODE**|프로그램 code 저장|

```swift
	var num:Int = 4
	var num2:Int = 5

	// code는 code에 적재가 되고, num = 4,
	// num2 = 5라는 값은 stack에 저장된다.
```

```swift
	let lb:UIVIew = UIView()
	
	// STACK <-- lb = 인스턴스 주소/ (lb:UIView)
	// HEAP <-- UIView인스턴스/ UIView()
	// CODE <-- 프로그램 code 저장/ let lb:UIView = UIView()
```

```swift
	static let number:Int = 5
	
	// DATA <-- static 값 저장/ number = 5
	// CODE <-- 프로그램 code 저장/ static let number:Int = 5
	// static을 사용하면 값이 STACK에 저장되지 않고
	// DATA에 저장이 된다.
```

```swift
	func sumTwoNumber(num1:Int, num2:Int) -> Int {
		return num1 + num2
	}
	
	// CODE <-- 프로그램 code 저장/ func {~ }
	// STACK <-- num1 = 3, num2 = 4 저장/ sumTwoNumber(num1:3, num2:4)
```

<br>

## Pointer
> Pointer는 프로그래밍 언어에서 다른 변수, 혹은 그 변수의 메모리 공간 주소를 가르키는 변수를 말한다.

<br>

```swift
	let num1:Int = 5
	let view:UIView = UIView()
	let num2 = num1
	
	STACK에 변수명: num1, view, num2/ 값: 5, 0x23171, 5가 저장된다.
	view의 경우HEAP에서 UIView Class instance의 주소값을 가져와 0x23171을 값으로 저장한다.
```

- 모든 자료형은 `struct` value 타입이다.
- value 타입은 HEAP에 생성되지 않는다. 값으로서 STACK에 존재한다.

<br>

###### 메모리 예제

```swift
	var b1:Book = Book(name:"책이름1", cost:1000, isbn:1)
	var b2 = b1
	b2.name = "톰소여의 모험"
        
	print(b1.name)
	print(b2.name)
        
	////////////////////////////////
	let bs1:BookStore = BookStore(name:"신사점", address:"신사동 어딘가")
	let bs2 = bs1
	bs2.name = "영등포점"
	print(bs1.name)
	print(bs2.name)
	
	//결과
	//책이름1
	//톰소여의 모험
	//영등포점
	//영등포점
```

- `let num = Int(someString)` : 엄밀히 따지면 캐스팅이 아님. `Int`형 `Instance`에 `String`값을 집어넣은 것.
- `struct`에서 함수를 만들경우 : `mutating func` 키워드를 사용해야 한다. 함수는 HEAP에 가야하는데 `struct`로 함수를 만들면 STACK에 적재된다... 왜지..

```swift
	mutating func addIsbn() {
		self.isbn = isbn + UInt(cost)
	}
```

<br>

## Deinit - struct는 불가!

```swift
class Student {
	init() {
		//인스턴스 생성시 필요한 내용 구현
	}
	deinit {
		//종료직전 필요한 내용 구현
	}
}
```

- class 인스턴스가 사라지기 직전에 deinit이 구현된다.
- 네비게이터를 사용할때 화면전환으로 페이지를 옮길시 **강제로 지워줘야하는 데이터나 인스턴스를 처리**할 수 있다.

<br>

## APPLE GUIDELINE : struct 생성 권장 사항
- 연관있는 간단한 값의 집합이 캡슐화 하는것만 목적일 때
- 캡슐화된 값이 참조보다 복사하는 것이 합당할 때
- `struct`의 `property`가 `value 타입`이며 reference 되는 것보다 복사가 합당할때
- 다른 타입으로부터 상속 받고나 상속될 필요가 없을때

- **reference < copy with value** 이면 struct 사용!

<br>

## Reference Counting
1. `let v:UIView = UIView()` 를 생성하면 `v`는 HEAP에 있는 UIView라는 클래스를 참조한다. 
2. `let v2:UIView = UIView()` 를 추가 생성하면 `v2`도 역시 HEAP에 있는 UIView라는 클래스를 참조한다.
3. 이때, UIView의 Reference Counting은 2다.
4. `v2`가 사용이 끝나게 되면 UIView의 Reference Counting은 1이다.
5. `v` 역시 사용이 종료되면 UIView의 Reference Counting은 0이 되며, Reference Counting이 0이 되면 HEAP에 있는 UIView의 메모리는 파기된다.

구체적인 Reference Counting은 ARC에서..