//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//시험 점수를 받아서 해당 점수의 등급을 반환하는 함수
//Grade = A+, A, B+, B, C+,...
func grade(fromScore score:UInt) -> String {
 
    var gradeValue:String = "F"
    
    switch score {
    case 95...100:
        gradeValue = "A+"
    case 90..<95:
        gradeValue = "A"
    default: //else와 같다고 생각하면 된다.
        gradeValue = "F"
    }
    return gradeValue
}

//등급을 받아서 포인트로.
func point(fromGrade grade:String) -> Double {
 
    var pointValue:Double = 0.0
    
    switch grade {
    case "A+":
        pointValue = 4.5
    case "A":
        pointValue = 4.0
        
    default:
        pointValue = 0.0
    }
    return pointValue
}
//점수를 포인트로.
func point(fromScore score:UInt) -> Double {
    return point(fromGrade: grade(fromScore: score))
    
}
