//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//(정)사각형의 넓이 구하는 함수 만들기
//argument : width(가로), length(세로).
//width * length

//원의 넓이 구하는 함수 만들기
//argument : radius(반지름)
//3.14 * radius * radius

//삼각형의 넓이 구하는 함수 만들기
//argument : base(밑변), height(높이)
//base * height / 2

//사다리꼴의 넓이 구하는 함수 만들기
//argument : base(밑변), top(윗변), height(높이)
//(top + base) / 2 * height

//(정)육면체의 부피 구하는 함수 만들기
//argument: width(가로), length(세로), height(높이)
//width * length * height

//원기둥의 부피 구하는 함수 만들기
//argument: radius(반지름), height(높이)
//3.14 * radius * radius * height

//구체의 부피 구하는 함수 만들기
//argument : radius(반지름)
//3.14 * radius * radius * radius * 4 / 3

//원뿔의 부피 구하는 함수 만들기
//argument: radius(반지름), height(높이)
//3.14 * radius * radius * height / 3


// flag값으로 angleCnt 추가.
func calcShape(angleCnt:UInt, radius:Double, width:Double, length:Double, height:Double, base:Double, top:Double) -> Double {
    var calcShape:Double = 0
    
    if radius > 0 && angleCnt == 0 {
        calcShape = 3.14 * radius * radius
        print("원의 넓이는 \(calcShape)")
        
    }else if radius > 0 && angleCnt == 1 {
        calcShape = 3.14 * radius * radius / 3
        print("원뿔의 부피는 \(calcShape)m^3입니다.")
        
    }else if (radius > 0 && height > 0) && angleCnt == 0 {
        calcShape = 3.14 * radius * radius * height
        print("원기둥의 부피는 \(calcShape)m^3입니다.")
        
    }else if (radius > 0 && height == 0) && angleCnt == 0 {
        calcShape = 3.14 * radius * radius * radius * 4 / 3
        print("구체의 부피는  \(calcShape)m^3입니다.")
        
    }else if width > 0 && length > 0 {
        calcShape = width * length
        print("사각형의 넓이는 \(calcShape)m^2입니다.")
    
    }else if base > 0 && angleCnt == 3 {
        calcShape = base * height / 2
        print("삼각형의 넓이는 \(calcShape)m^2입니다.")
        
    }else if base > 0 && angleCnt == 4 {
        calcShape = (base + top) / 2 * height
        print("사다리꼴의 넓이는 \(calcShape)m^2입니다.")
    
    }else if width > 0 && angleCnt == 4 {
        calcShape = width * length * height
        print("정육면체의 넓이는 \(calcShape)m^3입니다.")
    }
        
    return calcShape
}

calcShape(angleCnt:3, radius: 3, width:0 , length:0 , height: 10, base:5 , top:0 )
