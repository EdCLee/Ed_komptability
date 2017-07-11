//
//  Person.swift
//  Closure
//
//  Created by youngmin joo on 2017. 6. 26..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import Foundation

enum Gender: String
{
    case Man = "Man"
    case Woman = "Woman"
}

struct Person {
    var name: String
    var gender: Gender
    var age: Int
    
    init(name: String, gender: String, age: Int) {
        self.name = name
        self.gender = Gender(rawValue: gender) ?? .Man
        self.age = age
    }    
}
