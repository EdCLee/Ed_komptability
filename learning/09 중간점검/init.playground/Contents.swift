//: Playground - noun: a place where people can play

import UIKit

var str = String.init()
var str2 = ""

//strArray와 strArray2는 완전히 같은 소스
//String이 들어있는 Array
var strArray: [String] = ["ddd", "eee"]

//코드의 간편화 순서.
//var strArray2: Array<String> = []
//var strArray2: Array<String> = [String]
//var strArray2: Array<String> = Array<String>()
var strArray2: Array<String> = Array<String>.init()


var optionalStr: String? = nil
type(of: optionalStr)   //->Optional Type String
type(of: optionalStr!)  //-> String Type

class Person {
    var name: String
    init(withName name:String) {
        self.name = name
    }
}

var someone: Person = Person.init(withName: "Ed")