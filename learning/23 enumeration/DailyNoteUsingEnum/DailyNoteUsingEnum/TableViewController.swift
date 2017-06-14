//
//  TableViewController.swift
//  DailyNoteUsingEnum
//
//  Created by CLEE on 14/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit


//enum을 쓰라하니 enum을 썼.ㅇㄴㄹ머ㅓㄴ아로;ㅣㅇ남허ㅣ;ㅁ아류ㅗ;ㅐㅓ햐ㅓㄷ헙345ㅅ4ㅕ80[  48ㅕㅅ3ㅂ 7-ㅕㅛ5
class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let currentDate = Date()
        
        let dayFormatter = DateFormatter()
        let monthFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd.MM.yy"
//        dateFormatter.dateFormat = "MMMMd" //June14
//        dateFormatter.dateFormat = "MMMM" //June
//        dateFormatter.dateFormat = "d" //14
//        dateFormatter.dateFormat = "MM" //06
//        dateFormatter.dateFormat = "MMM" //Jun
        dayFormatter.dateFormat = "d"
        monthFormatter.dateFormat = "MMM"
        
        
        let dayOfToday = Int(dayFormatter.string(from: Date()))
        let monthOfToday = Int(monthFormatter.string(from: Date()))
        
        tableView?.scrollToRow(at: IndexPath(row: dayOfToday, section: monthOfToday), at: .top, animated: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 12
    }
    


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        switch section {
        case 11:
            return CalendarSet.December.MonthAndDay().day
            
        case 10:
            return CalendarSet.November.MonthAndDay().day
            
        case 9:
            return CalendarSet.October.MonthAndDay().day
            
        case 8:
            return CalendarSet.September.MonthAndDay().day
            
        case 7:
            return CalendarSet.August.MonthAndDay().day
            
        case 6:
            return CalendarSet.July.MonthAndDay().day
            
        case 5:
            return CalendarSet.June.MonthAndDay().day
            
        case 4:
            return CalendarSet.May.MonthAndDay().day
            
        case 3:
            return CalendarSet.April.MonthAndDay().day
            
        case 2:
            return CalendarSet.March.MonthAndDay().day
            
        case 1:
            return CalendarSet.Febuary.MonthAndDay().day
            
        case 0:
            return CalendarSet.January.MonthAndDay().day
        
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 11:
            return CalendarSet.December.MonthAndDay().month
            
        case 10:
            return CalendarSet.November.MonthAndDay().month
            
        case 9:
            return CalendarSet.October.MonthAndDay().month
            
        case 8:
            return CalendarSet.September.MonthAndDay().month
            
        case 7:
            return CalendarSet.August.MonthAndDay().month
            
        case 6:
            return CalendarSet.July.MonthAndDay().month
            
        case 5:
            return CalendarSet.June.MonthAndDay().month
            
        case 4:
            return CalendarSet.May.MonthAndDay().month
            
        case 3:
            return CalendarSet.April.MonthAndDay().month
            
        case 2:
            return CalendarSet.March.MonthAndDay().month
            
        case 1:
            return CalendarSet.Febuary.MonthAndDay().month
            
        case 0:
            return CalendarSet.January.MonthAndDay().month
            
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CustomCellViewController = tableView.dequeueReusableCell(withIdentifier: "Cell_ID") as! CustomCellViewController
        
        cell.dateFieldAtCell.text = "\(indexPath.row + 1)"
            
        return cell
    }

}
//    switch textField.tag {
//    case 1...4:
//    self.view.viewWithTag(textField.tag + 1)?.becomeFirstResponder()
//
//    default:
//    textField.resignFirstResponder()
//    }
//    return true
//      를 이용해서 코스를 줄이는 방법?

//  날짜를 거꾸로 계산해서 넣었더니 잘 안됨!!@!ㅓ@421ㅓ4ㅣ12ㅓ ㅎ8459ㅅ2ㅕㅎㅈ9ㅐ훋ㅂ2ㄱ3ㅣ하1!#!@#$ㅆ@ㅛ$%ㅛ@#% ㅛ %@
//
//
//
