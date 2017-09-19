//
//  NewDataCenter.swift
//  personManageProgramming
//
//  Created by 김태형 on 2017. 6. 26..
//  Copyright © 2017년 김태형. All rights reserved.
//

import Foundation

class NewDataCenter {
    static var name:String = ""{
        willSet{
            NewDataCenter.cellData.updateValue(newValue, forKey: "name")
        }
    }
    static var age:String = ""{
        willSet{
            
            NewDataCenter.cellData.updateValue(newValue, forKey: "age")
        }
    }
    static var gender:Gender = Gender.Male{
        willSet{
            NewDataCenter.cellData.updateValue(newValue, forKey: "gender")
        }
    }
    static var cellData:[String:Any] = [:]
    static var dataArray:[[String:Any]] = []
    static var maleNumArray:[Int] = []
    static var femaleNumArray:[Int] = []
}

enum Gender:Int
{
    case Male = 0
    case Female = 1
    
}
