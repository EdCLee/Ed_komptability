//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//: Playground - noun: a place where people can play


// while문 구구단
func multiplicationTable(firstNum:Int) -> Int {
    var times:Int = 1
    
    while times <= 9 {
        print("\(firstNum) * \(times) = \(firstNum * times)")
        times += 1
    }
    return times
}
multiplicationTable(firstNum: 4)

// for-in문 구구단
func timesTable(times:Int) {
    for i in 1...9 {
        print("\(times) x \(i) = \(times*i)")
        
    }
    
}
timesTable(times: 10)

// for-in문 예제
func getAnswer() {
    let base = 3
    let power = 3
    var answer:Int = 1
    
    for _ in 1...base {
        answer *= power
    }
    print(answer)
}
getAnswer()

// for-in 예제2
func factorial(num:Int) {
    var fac = 1
    for i in 1...num {
        fac *= i
    }
    print(fac)
}
factorial(num:10)

func findLotto() -> [Int] {
    var lottoNumbers:[Int] = []
    
    while lottoNumbers.count < 6 {
        let randomNum:UInt32 = arc4random_uniform(45)
        if !lottoNumbers.contains(Int(randomNum)) {
            lottoNumbers.append(Int(randomNum))
        }
    }
    return lottoNumbers
}

print(findLotto())



// 로또 숫자 6개 뽑기
// 중복 숫자 불가
func getLottoNum() -> [UInt32] {
    var lottoNumbers:[UInt32] = []
    
    while lottoNumbers.count < 6 {
        let randomNum:UInt32 = arc4random_uniform(45)
        //중복 숫자 체크
        if !lottoNumbers.contains(randomNum) && randomNum != 0 {
            lottoNumbers.append(randomNum)
        }
    }
    // sorted 정렬
    return lottoNumbers.sorted()
}
print(getLottoNum())
print(getLottoNum())
print(getLottoNum())


// MARK: 약수 구하기
func getDivisor(inNumber num:Int) -> [Int] {
    var result:[Int] = []
    
    for i in 1...num {
        if num % i == 0 {
            result.append(i)
        }
    }
    
    return result
}


// MARK: 소수 판별기
func isPrimeNumberOf(number num:Int) -> Bool {
    var result:Bool = false
    
    if getDivisor(inNumber: num).count <= 2 {
        result = true
    }
    
    return result
}
