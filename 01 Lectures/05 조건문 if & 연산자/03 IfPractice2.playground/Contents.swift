//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//점수를 받아서 그레이드 반환
func grade(inScore score:UInt) -> String {
    var grade:String = "F"
    
    //Uint는 '-' 값이 없으므로 모두 0보다 크다. 그래서 0≥score≥100이 아닌 score≥100
    if score <= 100 {
        if score > 95 {
            grade = "A+"
        }else if score < 90 {
            grade = "A"
        }else if score < 85 {
            grade = "B+"
        }else if score < 80 {
            grade = "B"
        }else if score < 75 {
            grade = "C+"
        }else if score < 70 {
            grade = "C"
        }else if score < 65 {
            grade = "D+"
        }else if score < 60 {
            grade = "D"
        }else{
            grade = "F"
        }
    }
    return grade
}

grade(inScore: 93)
grade(inScore: 45)
grade(inScore: 76)


//그레이드 받아서 포인트 반환
func point(inGrade grade:String) -> Double {
    var point:Double
    
    if grade == "A+" {
        point = 4.5
    }else if grade == "A"{
        point = 4.0
    }else if grade == "B+"{
        point = 3.5
    }else if grade == "B"{
        point = 3.0
    }else if grade == "C+"{
        point = 2.5
    }else if grade == "C"{
        point = 2.0
    }else if grade == "D+"{
        point = 1.5
    }else if grade == "D"{
        point = 1.0
    }else{
        point = 0.0
    }
    return point
}

point(inGrade: "A")
point(inGrade: "F")
point(inGrade: "D+")

//점수를 받아서 포인트로 반환
func point(inScore score:UInt) -> Double
{
//    let returnGrade:String = grade(inScore: score)
//    let returnPint:Double = point(inGrade:returnGrade)
//    
//    return returnPoint
    
    return point(inGrade: grade(inScore: score))
}
point(inGrade: grade(inScore: 90))
point(inGrade: grade(inScore: 56))
point(inGrade: grade(inScore: 100))
