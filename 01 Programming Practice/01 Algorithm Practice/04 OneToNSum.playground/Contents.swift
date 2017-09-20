//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//1부터 N까지의 합을 구하라.

// Using Recursion O
func nSumRecursion(n:Int) -> Int {
    
    var result:Int = 0
    
    if n == 1 {
        result = 1
    } else {
        result = n + nSumRecursion(n: n-1)
    }
    return result
}

nSumRecursion(n: 5)


// Using Iteration O
func nSumIteration(n:Int) -> Int {
    
    var result:Int = 0
    
    for i in 1...n {
    result += i
    }
    return result
}

nSumIteration(n: 5)



// Using Fomula n(n+1)/2
func nSumFomula(n:Int) -> Int {
    
    return n * (n+1) / 2
    
}

nSumFomula(n: 5)

