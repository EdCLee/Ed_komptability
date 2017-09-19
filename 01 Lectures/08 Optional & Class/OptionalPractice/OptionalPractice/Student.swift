//
//  Student.swift
//  OptionalPractice
//
//  Created by CLEE on 17/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import Foundation

class Student {
    
    var name:String
    var average:Double?
    //Type을 class Subject로 사용한다.
    var subjects:[Subject]?
    
    init(name:String) {
        self.name = name
    }

    // 과목을 추가하는 함수
    func add(subjectName name:String, score:Int) {
        if subjects == nil {
            subjects = []
        }
        
        let sj:Subject = Subject(name: name, score: score)
        subjects?.append(sj)
        
        
    }
}
