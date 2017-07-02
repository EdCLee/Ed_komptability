//: Playground - noun: a place where people can play

import UIKit

//let screen = UIScreen.main
//
//let data = UserDefaults.standard
//
//let app = UIApplication.shared
//
//let fileManager = FileManager.default



enum Gender:String
{
    case Man = "Man"
    case Woman = "Woman"
}

class Person {
    var name:String = ""
    var gender:Gender = .Man
    var age:Int = 0
    var idNum:Int = 0
    
    init(name:String, gender:String, age:Int, idNum:Int) {
        self.name = name
        self.gender = Gender(rawValue:gender) ?? .Man
        self.age = age
    }
}

extension Person:Equatable {
    
    static func == (lhs:Person, rhs:Person) -> Bool {
        return lhs.name == rhs.name
    }
}

class DataFile {
    
    static var sharedInstance = DataFile()
    
    var friendList = [Person]()
    
    func addList(_ friendInfo:Person) {
        friendList += [friendInfo]
        print(friendList)
    }
    
    func removeList(_ name:String) -> Bool {
        for listTemp in friendList {
            if listTemp.name == name {
                let index = friendList.index(of: listTemp)
                friendList.remove(at:index!)
                return true
            }
        }
        return false
    }
}

