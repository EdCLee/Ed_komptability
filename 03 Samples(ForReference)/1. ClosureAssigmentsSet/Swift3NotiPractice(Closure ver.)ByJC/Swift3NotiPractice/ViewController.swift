//
//  ViewController.swift
//  Swift3NotiPractice
//
//  Created by 박종찬 on 2017. 6. 29..
//  Copyright © 2017년 박종찬. All rights reserved.
//

import UIKit

let dataChangedNotification = Notification.Name.init(rawValue: "dataChanged")

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //옵저버 부분
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.dataReceived(_:)), name: dataChangedNotification, object: nil)
        
        NotificationCenter.default.addObserver(forName: dataChangedNotification, object: nil, queue: nil) { (notification: Notification) in
            print("클로저로 실행!", notification.object ?? "유저인포시 오브젝트 없음", notification.userInfo ?? "오브젝트시 유저인포 없음")
            
            
        }
        
        // 클로저 결과
        // 클로저로 실행! Swift3NotiPractice.Person(name: "a") 오브젝트시 유저인포 없음
        // 클로저로 실행! 유저인포시 오브젝트 없음 [AnyHashable("person"): Swift3NotiPractice.Person(name: "a")]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func dataReceived(_ notification: Notification) {
        
        //userInfo로 Person 구조체 받아오기
        print(notification.userInfo?["person"] ?? "object로 받을 때는 userInfo nil로")
        
        //object로 받아오기.
        print(notification.object ?? "userInfo로 받을 때는 object nil로")
        
//        결과값
//        Person(name: "a")
//        userInfo로 받을 때는 object nil로
//        object로 받을 때는 userInfo nil로
//        Swift3NotiPractice.Person(name: "a")
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

