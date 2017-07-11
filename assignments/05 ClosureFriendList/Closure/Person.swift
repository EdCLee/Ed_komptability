//
//  Person.swift
//  Closure
//
//  Created by CLEE on 2017. 6. 26..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//



//1. first step for build a data model

import Foundation

enum Gender: Int
{
    case woman = 0
    case man = 1
}

struct Person {
    let id: Int
    let name: String
    let gender: Gender
    var age: Int?
    var phoneNumber: String
    
    var dictionary: [String:Any] {
        get {
            return ["person_id":id, "name":name, "gender":gender.rawValue, "age":age!, "phone_number":phoneNumber]
        }
    }
    
    //struct는 init을 안해줘도 자동으로 memberwise 생성, 진행이 된다.
//    init(id:Int, name:String, gender:Gender, age:String, phoneNumber:String) {
//        
//        
//    }
    
    init(withDictionary dictionary: [String:Any]) {
        
        //as! 는 좋은게 아니니깐 실무에서는 사용 X
        self.id = dictionary["person_id"] as! Int
        self.name = dictionary[DataKey.name] as! String
        
        //enum 의 rawValue값이랑 바인딩
        self.gender = Gender.init(rawValue:dictionary["gender"] as! Int)!
        self.age = dictionary["age"] as? Int ?? 0
        self.phoneNumber = dictionary["phone_number"] as! String
    }
}

// DataKey값을 하게 되면 "name"을 name으로써 사용하도록 할 수 있다.
// 위에 "name" 대신 DataKey.name 으로 사용하면 된다.
struct DataKey {
    static let name: String = "name"
}




//enum Gender:String
//{
//    case Man = "Man"
//    case Woman = "Woman"
//}
//
//class Person {
//    var name:String = ""
//    var gender:Gender = .Man
//    var age:Int = 0
//    var idNum:Int = 0
//    
//    init(name:String, gender:String, age:Int, idNum:Int) {
//        self.name = name
//        self.gender = Gender(rawValue:gender) ?? .Man
//        self.age = age
//    }
//}
//
//
//// 주말 스터디의 결과물 E.Q.U.A.T.A.B.L.E.!!!!!
//extension Person:Equatable {
//    
//    static func == (lhs:Person, rhs:Person) -> Bool {
//        return lhs.name == rhs.name
//    }
//}
