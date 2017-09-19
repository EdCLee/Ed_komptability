# 에러처리

## 예외처리
- 프로그램의 오류 조건에 응답하고 오류 조건에서 복구하는 프로세스.
- Swift는 런타임시 복구 가능한 오류를 던지고, 포착하고, 전파하고, 조작하는 기능을 제공한다.
- 에러는 Error 프로토콜을 준수하는 유형의 값으로 나타낸다. 실제로 Error 프로토콜은 비어 있으나 오류를 처리할 수 있는 타입임을 나타낸다.

<br>

#### 열거형의 에러 표현
> Enum은 에러를 표현하는데 적합

```swift
enum VendingMachineError: Error {
	case invalidSelection
	case insufficientFunds(coinsNeeded:Int)
	case outOfStock
}

// 에러 프로토콜을 생성해준 것.
```

- throw 키워드를 통해 에러를 발생 시킨다.

```swift
throw VendingMachineError.insufficientFunds(coinNeeded: 5)
```

<br>

#### 에러전달
- 함수의 작성 중 에러가 발생할수 있는 함수에는 매개변수 뒤에 throws 키워드를 작성하여 에러가 전달될 수 있는 함수를 선언합니다.

<br>

#### 에러처리
- 함수가 에러를 throw하면 프로그램의 흐름이 변경되므로 에러가 발생할 수 있는 코드의 위치를 신속하게 식별 할 수 있어야 합니다.
- 이 장소를 식별하기 위해 try나 try?, try!를 사용할 수 있다.
- 발견된 에러를 처리하기 위해 do-catch문을 사용해서 에러를 처리 합니다.

<br>

#### do-catch 문

```swift
do {
	try expression
	statements
} catch pattern1 {
	statements
} catch pattern2 where condition {
	statements
}
```

<br>

#### Converting Error to Optional Value

```swift
func someThrowingFunction() throws -> Int {

}

let x = try? someThrowingFunction()

let y: Int?
do {
	y = try someThrowingFunction()
} catch {
	y = nil
}
```

<br>

#### Specifying Cleanup Actions(후처리)
- 에러에 의해 함수의 문제가 생기더라도 꼭 해야할 행동이 있다면, defer 구문을 통해 실행된다는 것을 보장할 수 있다.

```swift
func processFile(filename:String) throws {
	if exists(filename) {
		let file = open(filename)
		
		// defet는 무조건 실행되는 구문
		defer {
			close(file)
		}
		
		while let line = try file.readline() {
			//Work with the file
		}
		// close(file) is called here, at the end of the scope
	}
}
```