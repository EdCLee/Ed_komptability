//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//interpolation
print("print \(str)")

//var(varuable)
var name:String = "이창호"
print("my name is \(name)")
print("my name is" + name)

//Int(integer)
print("int의 최대 수 : \(Int.max)")
print("int의 최소 수 : \(Int.min)")

//Uint(unsigned integer)
print("UInt의 최대 수 : \(UInt.max)")
print("UInt의 최소 수 : \(UInt.min)")

let name1 = "joo"
var age = 10
var height = 4.124

var num1 = 10
var num2 = 11
num1 = num1 / 2
var num3 = num1 + num2
print("\(num3)")

//age = "joo"
// 배우는 과정에서는 타입을 꼭 적도록 한다.

//Type and Tuple array)
var coin:(Int,Int,Int,Int) = (3,1,5,3)
print("10원짜리 : \(coin.0)")
print("50원짜리 : \(coin.1)")
print("100원짜리 : \(coin.2)")
print("500원짜리 : \(coin.3)")

var person:(name:String, age:Int, weight:Double) = ("ED", 31, 70.34)
print("이름 : " + person.name)
print("나이 : \(person.age)")
print("몸무게 : \(person.weight)")

//Casting
//Int -> Double
var total:Int = 107
var average:Double
average = Double(total)/5

var stringNum:String
var doubleNum:Double
let intNum:Int = 3
//Int -> String
stringNum = String(intNum)
//Int -> Double
doubleNum = Double(intNum)
