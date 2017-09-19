//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func swapInt(_ num1:inout Int,_ num2:inout Int){
    let test:Int = num1
    num1 = num2
    num2 = test
}

func minusInt(number1 num1:Int, number2 num2:Int) -> Int{
    var tNum1 = num1
    var tNum2 = num2
    
    if tNum2 > tNum1 {
        swapInt(&tNum1,&tNum2)
    }
    return tNum1 - tNum2
}

minusInt(number1: 80, number2: 403)




//조건의 조합
//시험점수 95점 이상 100점 이하는 A+
//if(100 >= score  && 95 <= score)
//90점 이상 95점 미만은 A
//85점 이상 90점 미만은 B+
//80점 이상 85점 미만은 B
//.
//.

func scoreGrade(level score:Int) -> String {
    var grade:String
    
    if(100 >= score && 95 < score) {
        print("A+")
        grade = "A+"
    
    }else if(95 >= score && 90 < score) {
        print("A")
        grade = "A"

    }else if(90 >= score && 85 < score) {
        print("B+")
        grade = "B+"
        
    }else if(85 >= score && 80 < score) {
        print("B")
        grade = "B"
        
    }else if(80 >= score && 75 < score) {
        print("C+")
        grade = "C+"
        
    }else if(75 >= score && 70 < score) {
        print("C")
        grade = "C"
    }else{
        print("F")
        grade = "F"
    }
    return grade
}

scoreGrade(level: 90)

