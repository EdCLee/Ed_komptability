# Collection Type
>swift는 값의 모음을 저장하기 위한 `Array`(배열), `Set`(집합) 및 `Dictionary`(사전)이라는 세가지 기본형식을 제공합니다. `Class`가  아닌 자료형(Type). 
>
>`Tuple`은 여러가지 타입을 묶어놓은 자료 형. `Colletion Type`은 하나의 타입으로 된 전체.

- `Array` : 정렬 된 값의 모음. 인덱스가 있고 인덱스가 데이터를 관리한다.
	
	|`Index`|`Value`|
	|---|---|
	|0|Six Eggs|
	|1|Milk|
	|2|Flour| 
	
- `Set` : 집합을 표현할 때. 고유한 값의 정렬되지 않은 모음.
- `Dictionary` : `Keys`와 `Value`의 연관이 정렬되지 않은 모음.
<br>
<br>

## Mutability of Collections
- `var`에 할당하면 Collection를 변경 가능하다.
- 즉 Collection에 추가, 제거, 수정할 수 있다.
- 하지만 `let`에 할당하면 Collection를 변경 불가능하다.

## Array
> Array는 Index와 대응하는 데이터들로 이루어진 자료 구조를 나타낸다. 
> 
> 일반적으로 **배열에는 같은 종류의 데이터들이 순차적으로 저장**되며 값의 번호와 배열의 시작점으로부터 저장되어 있는 값의 상대적인 위치가 된다. 
> 
> 0부터 시작 값의 번호가 시작된다.

#### Array 문법
- 기본 표현은 `Array<Element>`로 Array Type을 나타낸다.
- 여기에서 Element는 배열에 저장할 수 있는 타입니다.
- 리터럴 문법으로 `[Element]`로 표현할 수 있다. 

```swift
	var someInts:[Int] = [Int]()
	var someInts:Array<Int> = Array<Int>()
	// 둘다 사용가능한 문법
```

#### 배열 리터럴
> 배열 리터럴 문법은 대괄호 []를 사용한다.

```swift
	// [값1, 값2, 값3]
	var someInts:[Int] = [1,2,3,4]
	someInts = []
```

#### 배열 Element 가져오기
> index를 통해 배열의 값을 가져올 수 있다.
> 
> index는 0부터 시작된다.

```swift
	var someInts:[Int] = [1,2,3,4]
	print("\(someInts[0])")  // 값  = 1
	print("\(someInts[3])")  // 값  = 4
```

#### 배열 추가 기능
- 현재 배열의 element count : `count`
- 빈 배열 확인 : `isEmpty` //Bool값으로 체크함
- element 추가 : `append()`
- element 삽입 : `insert()`
- element 삭제 : `remove()`

```swift
    // Array의 기본 문법 및 추가기능
    var list:Array<Int> = [1,2,3,4,5,6,7,8,9]
    
    list.append(10)
    list.insert(11, at: 3)
    list.remove(at: 0)
    
    list.removeLast()
    
    if !list.isEmpty {
        print(list)				// ->[2, 3, 11, 4, 5, 6, 7, 8, 9]
        print(list.count)		// ->9
    }
    print(list)					// ->[2, 3, 11, 4, 5, 6, 7, 8, 9]
        
    var list2:[Int] = [3,4]
    let list3 = list + list2
    
    print(list)					// ->[2, 3, 11, 4, 5, 6, 7, 8, 9]
    print(list3)				// ->[2, 3, 11, 4, 5, 6, 7, 8, 9, 3, 4]
```

## Set
> 같은 타입의 데이터가 순서없이 모여있는 자료구조, 각 항목의 순서가 중요치 않거나 한번만 표시해야하는 경우 배열대신 사용된다.

#### Set 문법
- 기본 표현은 Set<Element>로 Set Type을 나타낸다.
- 여기에서 Element는 배열에 저장할 수 있는 타입이다.
- Set은 Array와 다르게 축양 문법이 없다.

```swift
	var someInts:Set<Int> = Set<Int>()
```

#### Set 리터럴 사용
- Set Type으로 설정된 변수는 배열 리터럴을 이용해서 값을 설정할 수 있다.
- Set을 쓸때, 타입은 꼭 명시해주도록 한다. 타입을 안쓸경우 타입추론을 통해 배열로 인식한다.

```swift
	// [값1, 값2, 값3]
	var someInts:Set<Int> = [1,2,3,4]
	someInts = []
	var someStrings:Set = ["joo", "young"]
```

#### Set Element 가져오기
- Set은 순서가 정해져있지 않기 때문에 for-in 구문을 통해서 데이터를 가져와야 한다.
- 순서는 정해져 있지 않지만 정렬을 통해 데이터를 원하는 순서대로 가져올 수 있다.

#### Set 집합 연산
- `a.intersection(b)`
- `a.symmetricDifference(b)`
- `a.union(b)`
- `a.subtracting(b)`

```swift
	var oddDigits : Set = [1,3,5,7,9]
	let evenDigits : Set = [2,4,6,8]
	let primeDigits : Set = [2,3,5,7]
	
	oddDigits.intersection(evenDigits)
	
	oddDigits.symmetricDifference(primeDigits)
	
	oddDigits.union(evenDigits).sorted()
	
	oddDigits.subtract(primeDigits)
	
	//.sorted()는 정렬
	oddFigits.sorted()  
```

#### Set 기능

## Dictionary
> Dictionary는 순서가 정해져있지 않은 데이터에 키값을 통해 구분할 수 있는 자료구조. 
>
> 순서는 중요하지 않음.
>
> key값을 통해 데이터에 접근할때 사용.

#### Dictionary 문법
- 기본 표현은 `Dictionary<key, velue>`로 Dictionary Type을 나타낸다.
- key값은 Dictionary에서 value를 가져오는데 사용되는 값.
- 축약 문법 `[key:value]`로 표현 가능.

```swift
	var someInts:[String:Int] = [String:Int]()
	var someInts:
	
	// ex)
	// [String, String] key를 String, value를 String으로 가지고 있는 Dictionary.
	// [[String, String]] key를 String, value를 String으로 갖은 Dictionary 타입의 배열
	// [String:[Int]] key의 타입은 String, value는 Int 타입의 배열.
```

#### Dictionary 리터럴
- Dictionary의 리터럴 문법은 [:]를 사용한다.

```swift
	//[키1 : 값1 , 키2 : 값2, 키3 : 값3]
	var airports : [String : String] = ["ICN" : "인천공항", "CJU" : "제주공항"]
```
#### Dictionary Value 가져오기
- key값을 통해 value값을 가져올 수 있다.

```swift
	var airport : [String : String] = ["ICN" : "인천공항", "CJU" : "제주공항"]
	print("\(airport["ICN"])")
	print("\(airport["CJU"])")
```

#### Dictionary 기능

## 정리
Array는 넣은 순서대로 중복을 허용하며 저장하는 콜렉션, Set은 순서없이 중복되지 않는 값을 저장하는 콜렉션, Dictionary는 key-value 관계를 가지는 순서없는 콜렉션. `var`에 할당하면 mutable이 되고 `let`에 할당하면 immutable이다.

```swift
	var list:Array<Int>
	var setV:Set<Int>
	var dic:Dictionary<String, Int>
```
---
<br>
<br>
# 반복문
> 반복적으로 실행되는 코드를 만드는 구문
>
> 대표적으로 while, for-in문이 있다.

## while 문

- 조건이 참일경우 구문 반복 실행

```swift
	while 조건 {
		//구문 실행
	}
```

###### while 문 사용예제
```swift
	var index = 0
	
	while index < 10 {
	print("현재 횟수는 \(index)입니다.")
	index += 1
	}
	
	// 10번 실행
```

* 구문안에 조건을 변화시키는 내용이 없음. 무한 반복이 될수 있다.

###### 예제: while문 구구단 구현

```swift
	func multiplicationTable(firstNum:Int) -> Int {
	    var times:Int = 1
	    
	    while times <= 9 {
	        print("\(firstNum) * \(times) = \(firstNum * times)")
	        times += 1
	    }
	    return times
	}

	multiplicationTable(firstNum: 4)
```
###### 결과
 
```
	4 * 1 = 4
	4 * 2 = 8
	4 * 3 = 12
	4 * 4 = 16
	4 * 5 = 20
	4 * 6 = 24
	4 * 7 = 28
	4 * 8 = 32
	4 * 9 = 36
```

## for-in문
> 배열의 항목, 숫자의 범위 또는 문자열의 문자와 같은 시퀀스를 반복하려면 `for-in` 반목문을 사용

```swift
	let numbers = [1,2,3,4,5]
	
	for number in numbers {
		print("\(number)")
	}
```

###### 숫자 범위의 연산

```swift
	for index in 1...5 {
		print("\(index) times 5 is \(index * 5)")
	}
```

###### Wild Card (_)
- 문법상 필요하지만 실제 동작에서 사용하지 않는 변수 이름에 밑줄을 그어 표현한다.

```swift
	let base = 3
	let power = 10
	var answer = 1
	
	for _ in 1...power {
		answer *= base
	}
	
	print(answer)
	//answer = 27
```

###### 예제: for-in문 구구단 구현
```swift
	func timesTable(times:Int) {
	    for i in 1...9 {
	        print("\(times) x \(i) = \(times*i)")        
	    }
	}
	
	timesTable(times: 10)
```

###### 예제: 로또 번호 뽑기 (중복 허용)
```swift
	func findLotto() -> [Int] {
	    var lottoNumbers:[Int] = []
	    
	    for _ in 1...6 {
	        let randomNum:UInt32 = arc4random_uniform(45)
	        lottoNumbers.append(Int(randomNum))
	    }
	    return lottoNumbers
	}
	
	// 함수 실행은 veiwDidLoad에서 한다.
	print(findLotto())
```

###### 예제: 로또 번호 뽑기 (중복 불가)
```swift
	func getLottoNum() -> [UInt32] {
	    var lottoNumbers:[UInt32] = []
	    // 배열은 0부터 시작함. 그러므로 갯수가 <6을 하면 6개가 나옴.
	    while lottoNumbers.count < 6 {
	        let randomNum:UInt32 = arc4random_uniform(45)
	        //중복 숫자 체크 & 0 체크
	        if !lottoNumbers.contains(randomNum) && randomNum != 0 {
	            lottoNumbers.append(randomNum)
	        }
	    }
	    // sorted 정렬
	    return lottoNumbers.sorted()
	}
	
	print(getLottoNum())
```

###### 예제: 약수 구하기
```swift

```
###### 예제: 소수 판별기
```swift

```