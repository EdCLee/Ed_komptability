//
//  Person.swift
//  PersonList
//
//  Created by 샤인 on 2017. 6. 26..
//  Copyright © 2017년 IosCamp. All rights reserved.
//

import Foundation

enum Gender:String
{
    case Man
    case Woman
}

struct Person {
    var name:String 
    var gender:Gender
    var age:Int
    
    init(name: String, gender: String, age: Int) {
        self.name = name
        self.gender = Gender(rawValue: gender) ?? .Man
        self.age = age
    }
}
