//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 1. 절대값 프린트.
// - 값이 < 0, * -1
func absolute(num:Int) -> Int
{
    var absoluteNum:Int = num
    
    if absoluteNum < 0 {
        absoluteNum *= -1
    }
    
    return absoluteNum
}
absolute(num: -1)
absolute(num: 1)
absolute(num: 0)

// 2. 홀짝 프린트 함수(홀수 인지 짝수인지 확인)
func printEvenOrOdd(num:Int){
    if num == 0 {
        print("0 입니다.")
    }else if num % 2 == 0 {
        print("짝수 입니다.")
    }else{
        print("홀수 입니다.")
    }
}
printEvenOrOdd(num: -80)
printEvenOrOdd(num: 21)
printEvenOrOdd(num: 0)



// 3. 영화표값 계산하기.
//기본가격 :        9000원
//10시까지 조조 :   -10%
//청소년 :         -10%
//argument : 영화시간(24시간제), 성인인원, 청소년인원.
func mTicketPrice(startTime time:UInt, adulteCount aCount:Int, teenagerCount tCount:Int) -> UInt
{
    var totalPrice:UInt = 0
    
    if aCount > 0 || tCount > 0 {
        totalPrice += UInt(aCount * 9000)
        totalPrice += UInt((Double(tCount * 9000) * 0.9))
        
        if time <= 10 {
            totalPrice = UInt(Double(totalPrice) * 0.9)
        }
    }
    return totalPrice
}
mTicketPrice(startTime: 9, adulteCount: 4, teenagerCount: 6)
mTicketPrice(startTime: 9, adulteCount: 4, teenagerCount: 0)


// 4. 지폐별 갯수
//금액을 입력받고 100원, 500원, 1,000원, 5,000원, 10,000원, 50,000원권으로 각각 몇 장씩 나눠지는지 프린트.
// -통장이 아니므로 UInt
func countChanges(forMoney money:UInt) -> (count50000Won:UInt, count10000Won:UInt, count5000Won:UInt, count1000w:UInt, count500w:UInt, count100w:UInt) {
    var remainMoney = money
    
    //숫자는 Int기 때문에 var로 변수 선언할 때 UInt로 형을 선언하면 숫자도 UInt로 적용
    var count50000Won:UInt = 0
    var count10000Won:UInt = 0
    var count5000Won:UInt = 0
    var count1000Won:UInt = 0
    var count500Won:UInt = 0
    var count100Won:UInt = 0
    
    if remainMoney >= 50000 {
        count50000Won = remainMoney / 50000
        remainMoney = remainMoney % 50000
    }
    if remainMoney >= 10000 {
        count10000Won = remainMoney / 10000
        remainMoney = remainMoney % 10000
    }
    if remainMoney >= 5000 {
        count5000Won = remainMoney / 5000
        remainMoney = remainMoney % 5000
    }
    if remainMoney >= 1000 {
        count1000Won = remainMoney / 1000
        remainMoney = remainMoney % 1000
    }
    if remainMoney >= 500 {
        count500Won = remainMoney / 500
        remainMoney = remainMoney % 500
    }
    if remainMoney >= 100 {
        count100Won = remainMoney / 100
        remainMoney = remainMoney % 100
    }
    
    return (count50000Won, count10000Won, count5000Won, count1000Won, count500Won, count100Won)
}



// 5. 윤년구하기
//서력 기원 연수가 4로 나누어떨어지는 해는 윤년으로 한다.(2004년, 2008년, 2012년, 2016년, 2020년, 2024년 …)
//이 중에서 100으로 나누어떨어지는 해는 평년으로 한다.(1900년, 2100년, 2200년, 2300년, 2500년 …)
//그중에 400으로 나누어떨어지는 해는 윤년으로 둔다.(1600년, 2000년, 2400년 …)
//400>100>4

//연도를 입력받고 윤년인지 평년인지 프린트.
func leapYear(Count year:UInt) -> Bool {
    if (year % 4 == 0 && year % 400 == 0) || year % 100 != 0 {
        print("윤년")
        return true
    }else{
        print("평년")
        return false
    }
}
leapYear(Count: 1000)
leapYear(Count: 1500)
leapYear(Count: 1600)
leapYear(Count: 2000)
leapYear(Count: 2200)
leapYear(Count: 4)




