# 재귀함수 Recursive Function
> 자신을 정의할 때 자기 자신을 재참조하는 방법

<br>

```swift
	func factorial(n:Int) -> Int {
		var fac:Int = 1
			
		for i in 1...n {
			fac = fac * i
		}
		return fac
	}
	
	// 자기 자신을 재 호출을 하면서 반복적인 행동을 한다.
	// 자기 자신이 함수가 되는 것.
	func recFactorial(n:Int) -> Int {
		if n <= 1 {
			return 1
		}else{
		return n * recFactorial(n:n-1)
		}
	}
``` 

<br>

Collatz Conjection : 재귀함수를 이용한 Collatz

- 함수가 간단해지며 연산을 많이하지 않지만 메모리르 많이 차지한다.

```swift
	func collatz(n:Int) -> Int {
   		if n == 1 {
   			return 0
   		}else {
   			if n % 2 == 0 {
   				return 1 + collatz(n: n/2)
   			}else {
   				return 1 + collatz(n: (n*3)+1)
   			}
   		}
   	}
```

<br>

Fibonacci Numbers : 재귀함수를 이용한 피보나치 수열 자릿수 구하기.

```swift
//MARK: FIBONACCI NUMBERS////////////////////
func fibonacciNumbers(n:Int) -> Int {
    //메모리 많이 먹으니깐 20이상은 금지. 맥북 비행하게 됨.
    if n <= 1 {
        return n
    }else {
        return fibonacciNumbers(n: n-1) + fibonacciNumbers(n: n-2)
    }
}

fibonacciNumbers(n: 20)
//n = 6765
```

<br>

Fibonacci Numbers : 재귀함수를 이용한 피보나치 수열 자릿수 만큼 나열하기.

```swift
//MARK: FIBONACCI NUMBERS ARRAY//////////////
func fibonacciArray(inputNumber:Int) -> [Int] {
    
    let n = inputNumber - 1
    
    if n == 1 {
        return [1, 1]
        
    }else {
        
        var resultArray = fibonacciArray(inputNumber: n)
        
        let result:Int = resultArray[n - 1] + resultArray[n - 2]
        resultArray.append(result)
        return resultArray
    }
}

fibonacciArray(inputNumber: 10)
//inputNumber = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
```

<br>

# The Tower of Hanoi

```swift
// 원판이 1개면 출발지 -> 목적지
// 원판이 1개가 아닌 경우.
// n-1개의 원판을 출발지에서 목적지를 거쳐 경유지로
// n 번을 출발지에서 목적지로
// n-1개를 경유지에서 출발지를 거쳐 목적지로
var count:Int = 0

func hanoiTower(diskCount:Int, pegA:String, pegB:String, pegC:String) {
    
    // 1개면 출발지에서 목적지로
    if diskCount == 1 {
        print("Move disk \(diskCount) from \(pegA) to \(pegC)")
    }else if diskCount != 1 {
        // 디스크 갯수가 1이 아닌경우 재귀함수를 이용해 재호출 후 디스크 갯수 -1을 수행하고
        // parameter 값을 다른 변수 자리에 binding 해줌으로써 loop가 가능해진다.
        hanoiTower(diskCount: diskCount - 1, pegA: pegA, pegB: pegC, pegC: pegB)
        print("Move disk \(diskCount) from \(pegA) to \(pegC)")
        hanoiTower(diskCount: diskCount - 1, pegA: pegB, pegB: pegA, pegC: pegC)
    }
    count += 1
}
// peg의 위치를 바꾼다고 생각하고 접근하면 조금 더 쉽게 풀 수 있다.
// peg를 움직인다는 생각이 결국 재귀함수와 연결이 된다.

hanoiTower(diskCount: 3, pegA: "A", pegB: "B", pegC: "C")
print("\(count)번 수행 했다")

// Move disk 1 from A to C
// Move disk 2 from A to B
// Move disk 1 from C to B
// Move disk 3 from A to C
// Move disk 1 from B to A
// Move disk 2 from B to C
// Move disk 1 from A to C
// 7번 수행 했다
```

<br>
<br>
<br>
