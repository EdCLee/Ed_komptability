//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//+/-를 알기위해 Bool을 사용
func isEven(number num:Int) -> Bool {
    //2로 나눠서 나머지가 0이면 분기1에서 리턴, 0이 아니면 분기2에서 리턴
    if num % 2 == 0 {
        //분기1 num은 짝수
        return true
    }else{
        //분기2 num은 홀수
        return false
    }
}

let evenNumber:Bool = isEven(number: 23232)
//let evenNumber2:Bool = isEven(232321)
isEven(number: 996)
isEven(number: 45)
isEven(number: -96)
isEven(number: 090)

print(evenNumber)
//print(evenNumber2)

func isEven2(number num:Int) -> Bool {
    if (num % 2) == 0 {
        return true
    }else{
        return false
    }
}





let p1:(height:Double, weight:Double, money:Int) = (170, 70, 1000000000)
let p2:(height:Double, weight:Double, money:Int) = (180, 90, 50000000)
let p3:(height:Double, weight:Double, money:Int) = (165, 60, 500000)

func isAbleMeetting(person:(height:Double, weight:Double, money:Int)) -> Bool {
    if person.height >= 170 && person.weight <= 70 && person.money >= 20000000 {
        print("퍼펙트 무조건 소개!")
        return true
        
        //조건을 괄호로 묶어 하나의 조건으로서 || 연산자에 "조건 || 조건"으로 사용할 수 있다.
    }else if (person.height >= 170 && person.weight <= 70) || person.money >= 20000000 {
        print("어쨋든 가능!")
        return true
    //괄호는 수식계산에서와 같이 순서를 구분해주는 용도로 사용하는게 좋다.
    //}else if person.height >= 170 || person.weight <= 70 || person.money >= 20000000 {
    }else if (person.height >= 170 || person.weight <= 70) || person.money >= 20000000 {
        print("제안 가능!")
        return true
    }else{
        print("불가!")
        return false
    }
}
isAbleMeetting(person: p1)
isAbleMeetting(person: p2)
isAbleMeetting(person: p3)
/*
괄호에 대해서
A, B, C 를 비교하려 한다.
A는 flase, B는 true, C는 true 라면
1. (A && B) || C => true
2. A && (B || C) => false
1번과 2번의 결과가 달라진다.
기본적으로 다중 비교연산을 해야할 때 &&연산자에 괄호를 해주는게 좋으나 상황에 알맞게 사용한다.
*/





// 1. 두수의 값을 스위치
func swapToInt(_ num1:inout Int, _ num2:inout Int) {
    let temp:Int = num1
    num1 = num2
    num2 = temp
}
// 2.
//func minus(firstNum num1:Int, secondNum num2:Int) -> Int {
//    if num2 > num1 {
//        swapToInt(&num1,&num2)
//    }
//    return num1 - num2
//}
// 설명.
// 함수 안에서의 인자값은 상수로 존재한다.
// "2. minus"함수의 if문 안에서 사용하려는 "swapToInt"함수는 상수인데 
// "1.swapToInt"함수에서는 inout을 통해 변수로 사용하려하기 때문에 Error.

//func minus(firstNum num1:Int, secondNum num2:Int) -> Int {
//    if num2 > num1 {
//        var vNum1 = num1
//        var vNum2 = num2
//        swapToInt(&vNum1,&vNum2)
//    }
//    return vNum1 - vNum2
//}
// 설명.
// 변수로 사용하고자 변수 선언 var vNum1을 선언(초기화) 했으나 if문 안에서
// 새로 선언한 변수의 생명주기가 죽기 때문에 if문 밖에서 선언을 해줘야 한다.
// 결과물은 3. 참고

// 3. 앞에 수에서 뒤에 수를 빼는 함수.
// 만약 뒤에수가 크다면 swapToInt 함수를 사용해서 값을 스위치 한다.
func minus(firstNum num1:Int, secondNum num2:Int) -> Int {
    var vNum1 = num1
    var vNum2 = num2

    if vNum2 > vNum1 {
        swapToInt(&vNum1,&vNum2)
    }
    return vNum1 - vNum2
}

print(minus(firstNum: 5, secondNum: 10))
print(minus(firstNum: 10, secondNum: 5))





