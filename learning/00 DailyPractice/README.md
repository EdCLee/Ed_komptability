# Swift

## Variable
> 시스템 예약어는 변수명으로 사용 불가
> 
> 숫자는 이름으로 시작불가
> 
> 공백포함 x
> 
> 변수와 함수명은 `camelCasing`
> 
> 클래스명은 `PascalCasing`

```swift
	var variableName:Type = value
	// var stringName:String = ""
	// var numericVar:Int = 0
```

<br>

## Constant

```swift
	let constantName:Type = value
	// let stringCon:String = ""
	// let numericCon:Int = 0
```

<br>

## Data Type
|Type||||
|---|---|---|---|
|`Int`|-1,1,2,3,4,100,...|음수를 포함한 정수형|var numericType:Int|
|`UInt`|1,2,3,4,...|양수만 가능한 정수형|var numericType:UInt|
|`String`||문자열|var stringType:String|
|`Double`|1.1, 1.54, 2.35||var doubleType:Double|

<br>

## 연산자
|연산자||||
|---|---|---|---|
|||||

## Tuple

```swift
	var TupleA:(Int, Int, Int, Int) = (3, 1, 5, 3)
	print("1번Int : \(TupleA.0)")
	print("2번Int : \(TupleB.1)")
	
	var TupleB:(name:String, age:Int, weight:Double) = ("Ed", 31, 80)
	print("이름 : \(TupleB.name)")
	print("나이 : \(TupleB.age)")
```

<br>

## Function

키워드 + 함수명 + 입력값 + 함수내용 + 결과타입

```swift
	func funcName(argumentsName parameter:Type) ->ReturnType {
	
		code
	
	return code
	//or print()
	}
```

## Control Flow

#### if

```swift
	if condition {
		code
	}else if {
		code
	}else {
		code
	} return
```

#### for-in

```swift
	for item in items {
		code
	}
```

#### while

```swift
	while condition {
		statements
	}
```

#### switch

```swift
	switch value {
	case pattern:
		code
	default:
		code
   }
```

<br>

## init

<br>

## Optional
`!`

`?`

<br>

###### Forced Unwrapping
```swift
	if let constantName:Type = optional {
		statements
	}
```

<br>

## override

<br>

## overload

<br>

## UI Code

<br>

## Random
`arc4random()` or `arc4random_uniform()`. They are in the `Darwin` module, so if you haven't imported `AppKit`, `UIKit`, or `Foundation` (which import it for you), you will need to import `Darwin`. Use `arc4random_uniform(n)` for a random integer between 0 and n-1

```swift
	let diceRoll = Int(arc4random_uniform(6) + 1)
	// Cast the result to Int so you don't have to explicitly 
	// type your vars as UInt32 (which seems un-Swifty)
```
<br>

`arc4random` works well in Swift, but the base functions are **limited to 32-bit integer types** (Int is 64-bit on iPhone 5S and modern Macs). Here's a generic function for a random number of a type expressible by an integer literal:

```swift
public func arc4random<T: ExpressibleByIntegerLiteral>(_ type: T.Type) -> T {
    var r: T = 0
    arc4random_buf(&r, MemoryLayout<T>.size)
    return r
}
```
We can use this new generic function to extend `UInt64`, adding boundary arguments and mitigating modulo bias. (This is lifted straight from arc4random.c)

```swift
public extension UInt64 {
    public static func random(lower: UInt64 = min, upper: UInt64 = max) -> UInt64 {
        var m: UInt64
        let u = upper - lower
        var r = arc4random(UInt64.self)

        if u > UInt64(Int64.max) {
            m = 1 + ~u
        } else {
            m = ((max - (u * 2)) + 1) % u
        }

        while r < m {
            r = arc4random(UInt64.self)
        }

        return (r % u) + lower
    }
}
```

With that we can extend Int64 for the same arguments, dealing with overflow:

```swift
public extension Int64 {
    public static func random(lower: Int64 = min, upper: Int64 = max) -> Int64 {
        let (s, overflow) = Int64.subtractWithOverflow(upper, lower)
        let u = overflow ? UInt64.max - UInt64(~s) : UInt64(s)
        let r = UInt64.random(upper: u)

        if r > UInt64(Int64.max)  {
            return Int64(r - (UInt64(~lower) + 1))
        } else {
            return Int64(r) + lower
        }
    }
}
```

To complete the family...

```swift
private let _wordSize = __WORDSIZE

public extension UInt32 {
    public static func random(lower: UInt32 = min, upper: UInt32 = max) -> UInt32 {
        return arc4random_uniform(upper - lower) + lower
    }
}

public extension Int32 {
    public static func random(lower: Int32 = min, upper: Int32 = max) -> Int32 {
        let r = arc4random_uniform(UInt32(Int64(upper) - Int64(lower)))
        return Int32(Int64(r) + Int64(lower))
    }
}

public extension UInt {
    public static func random(lower: UInt = min, upper: UInt = max) -> UInt {
        switch (_wordSize) {
            case 32: return UInt(UInt32.random(UInt32(lower), upper: UInt32(upper)))
            case 64: return UInt(UInt64.random(UInt64(lower), upper: UInt64(upper)))
            default: return lower
        }
    }
}

public extension Int {
    public static func random(lower: Int = min, upper: Int = max) -> Int {
        switch (_wordSize) {
            case 32: return Int(Int32.random(Int32(lower), upper: Int32(upper)))
            case 64: return Int(Int64.random(Int64(lower), upper: Int64(upper)))
            default: return lower
        }
    }
}
```

After all that, we can finally do something like this:

```swift
	let diceRoll = UInt64.random(lower: 1, upper: 7)
```

Here is to pick random string:

```swift
let array = ["Frodo", "sam", "wise", "gamgee"]
let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
print(array[randomIndex])
```