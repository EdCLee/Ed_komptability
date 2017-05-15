//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 1. inch to cm, cm to inch (2개)
func cm(fromInch inch:Double) -> Double {
    return inch * 2.54
}

func inch(fromCm cm:Double) -> Double {
    return cm * 0.393701
}


// 2. m2 to 평, 평 to  m2 (2개)
func pyeong(fromSM squareMeter:Double) -> Double {
    return squareMeter * 0.3025
}

func squareMeter(fromPyeong pyeong:Double) -> Double {
    return pyeong * 3.305785
}


// 3. 화씨 to 섭씨, 섭씨 to 화씨 (2개)
func celcius(fromFahrenheit fahr: Double) -> Double {
    return fahr * -17.222222
}
func fahrenheit(fromCelcius celc: Double) -> Double {
    return celc * 33.8
}


// 4. 데이터량 (KB to MB, MB to GB) (2개)
func megabyte(fromKilobyte kb: Double) -> Double {
    return kb * 0.000977
}
func kilobyte(fromMegabyte mb: Double) -> Double {
    return mb * 1024
}


// 5. 시간(hhmmss)을 받으면 초단위로 변경, 초단위를 시간으로 변경
// ex) 1/13/20 >> 4400초

func second(fromTime time:UInt) -> UInt
{
    let hour:UInt = time / 10000
    let min:UInt = (time % 10000) / 100
    let sec:UInt = time % 100
    
    // 3600: 시간을 초로 변경하기 위한 60초 * 60분
    // 60: 분을 초로 변경하기 위한 수
    return (hour * 3600) + (min * 60) + sec

}

// from i.hyeongsu.Ham
// 5. 시간(hhmmss)을 받으면 초단위로 변경, 초단위를 시간으로변경
// ex) 11320 >> 4400초
//func timeToSeconds(currentTime t: (hh: Int, mm: Int, ss: Int)) -> Int {
//    return t.hh * 3600 + t.mm * 60 + t.ss
//}
//timeToSeconds(currentTime: (hh: 01, mm: 13, ss: 20))
//
//
//func secondsToTime(seconds s: Int) -> (hh: Int, mm: Int, ss: Int) {
//    var currentTime: (hh: Int, mm: Int, ss: Int) = (0, 0, 0)
//    var remainder: Int = 0
//    
//    if s >= 3600 {
//        currentTime.hh = s / 3600
//        remainder = s % 3600
//    }
//    if s >= 60 {
//        currentTime.mm = remainder / 60
//        remainder = s % 60
//    }
//    if s >= 0 {
//        currentTime.ss = remainder
//    }
//    
//    return currentTime
//}
//var currentTime = secondsToTime(seconds: 4400)
//// print("current time is \(currentTime.0) : \(currentTime.1) : \(currentTime.2)")
//print("current time is \(currentTime.hh) : \(currentTime.mm) : \(currentTime.ss)")
