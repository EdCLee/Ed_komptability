//: Playground - noun: a place where people can play

import UIKit

var name:String = "Changho Lee"

print("안녕" + " " + name)

//주석을 입력

// cmd + /
//여기에는 문단열 주석을 사용합니다
//여기에는 문단열 주석을 사용합니다
//여기에는 문단열 주석을 사용합니다
//

/* 이건 단축키가 없으므로 플로그인을 설치 해야 함.
여기에는 문단열 주석을 사용합니다
여기에는 문단열 주석을 사용합니다
여기에는 문단열 주석을 사용합니다
*/

//이름을 출력하는 함수를 만들어 봅시다.
func print(name printStr:String)
{
    print(printStr)
}

print(name: "Apple")
print(name: "Bacon")
print(name: "Cheese")
print(name: "DrPepper")


func addInt(num1 firstNum:Int, num2 secondNum:Int) -> Int
{
    return firstNum + secondNum
}
var totalNum:Int = addInt(num1: 100, num2: 498)


//외부에 있는 값도 받아서 사용 가능
func average() -> Double
{
    return Double(totalNum)/2
}
var avg = average()


//리턴 없이 프린트를 함수 내부에
//func named (fullName named:String)
//{
//    print(named)
//}
//named(fullName: "Changho")
//named(fullName: "Ed")
//named(fullName: "Lee")

//함수로 개인정보 입력해보기
func named (firstName name1:String, nickName name2:String, lastName name3:String) -> String
{
    return name1 + name2 + name3
}
var fullName:String = named(firstName: "Changho ", nickName: "\"Ed\" ", lastName: "Lee ")

print(fullName)

//in-out Prarameter Keyword 파라미터로 넘어오는 값은 상수가 되는데 그 값을 변경가능하게 하기 위함
func swapTwoInts(_ a:inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107

print("\(someInt) \(anotherInt)")
swapTwoInts(&someInt, &anotherInt)
//wildCard를 사용안할 경우 a:와 b:가 이름이 되므로
//swapTwoInts(a:&someInt, b:&anotherInt)
print("\(someInt) \(anotherInt)")


//여러가지 함수 - 매개변수
var num1:Int = 10
var num2:Int = 20

func getNumber(firstNum num1:Int) -> Int {
    return num1
}
print("\(num1) \(num2)")

func getNumber(num1:Int) -> Int {
    return num1
}
print("\(num1) \(num2)")

func getNumber() -> Int {
    var num1:Int = 22
    return num1
}
print("\(num1) \(num2)")

func getNumber(firstNum num1:Int, secondNum num2:Int) -> Int {
    return num1 + num2
}
print("\(num1) \(num2)")

func sumNumber(num1:Int, num2:Int = 5) -> Int {
    return num1 + num2
}
print("\(num1) \(num2)")
