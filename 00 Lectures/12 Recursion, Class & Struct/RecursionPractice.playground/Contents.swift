//: Playground - noun: a place where people can play

import UIKit

var str = "Recursion Function Practice HERE!"

//MARK: COLLATZ CONJECTURE///////////////////
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

collatz(n:5)


func collatz2(n:Int) -> Int {
    if n == 1 {
        return 0
    }else if n % 2 == 0 {
        return 1 + collatz(n: n/2)
    }else {
        return 1 + collatz(n: (n*3) + 1)
    }
}

collatz2(n: 5)



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
