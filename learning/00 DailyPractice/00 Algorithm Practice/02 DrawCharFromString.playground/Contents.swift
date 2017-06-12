//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// 가운데 문자 추출하기
func drawCharFromString(string:String) -> String {
    
    var n = string.characters.count
    var strings = string
    
    if n % 2 == 0 {
        strings.characters.removeFirst(n / 2)
        strings.characters.removeLast(n / 2)
        print(strings)
    }else{
        strings.characters.removeFirst(n-1/2)
        strings.characters.removeLast(n-1/2)
        print(strings)
    }
    return strings
}



drawCharFromString(string: "asdfds")