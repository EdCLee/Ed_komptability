//
//  DataCenter.swift
//  DailyNoteUsingEnum
//
//  Created by CLEE on 14/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import Foundation

enum CalendarSet: Int {
  
    case January = 1
    case Febuary
    case March
    case April
    case May
    case June
    case July
    case August
    case September
    case October
    case November
    case December
    
    func MonthAndDay() -> (month:String, day:Int) {
        switch self {
        case .January:
            return (month:"January", day:31)
        case .Febuary:
            return (month: "Fabuary", day: 28)
        case .March:
            return (month: "March", day: 31)
        case .April:
            return (month: "April", day: 30)
        case .May:
            return (month:"May", day:31)
        case .June:
            return (month: "June", day: 30)
        case .July:
            return (month: "July", day: 31)
        case .August:
            return (month: "August", day: 30)
        case .September:
            return (month:"September", day:31)
        case .October:
            return (month: "October", day: 30)
        case .November:
            return (month: "November", day: 31)
        case .December:
            return (month: "December", day: 30)
        }
    }
}
