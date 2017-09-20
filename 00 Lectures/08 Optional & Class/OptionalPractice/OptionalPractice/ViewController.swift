//
//  ViewController.swift
//  OptionalPractice
//
//  Created by CLEE on 17/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
//    var friendList:[String]? // optional 로 선언
//    
//    var friendListDictionary:[[String:String]]? // optional로 선언
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        print("String 변수를 element 로 가지는 배열")
//        
//        addFriend(friend:"John")
//        addFriend(friend:"Jane")
//        
//        printFriendList()
//        
//        print("Dictionary 변수를 element 로 가지는 배열")
//        
//        addFriendDictionary(name: "John", gender: "Male")
//        addFriendDictionary(name: "Jane", gender: "Female")
//        
//        //printFriendListDictionary()
//        
//        let friendNames:[String] = friendNames()
//        
//        //print(friendNames)
//        
//        for name in friendNames {
//            print(name)
//        }
        
        let s1:Student = Student(name: "Ed")
        s1.add(subjectName: "Math", score: 99)
        s1.add(subjectName: "English", score: 80)
        s1.add(subjectName: "Science", score: 100)
        s1.add(subjectName: "Society", score: 100)
        s1.add(subjectName: "History", score: 60)
        
        let s2:Student = Student(name: "Irene")
        s2.add(subjectName: "Math", score: 80)
        s2.add(subjectName: "English", score: 100)
        s2.add(subjectName: "Science", score: 60)
        s2.add(subjectName: "Society", score: 90)
        s2.add(subjectName: "History", score: 60)
        
        let manager:ScoreManager = ScoreManager()
        let s1Average = manager.average(forStudent: s1)
        let s2Average = manager.average(forStudent: s2)
        
        print(s1Average)
        print(s2Average)
        
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    
    var friendList:Array<Dictionary<String,String>>?
    //var friendList:Array<[String:String]>?
    //var friendList:[[String:String]]?
    
    
    func addFriend(name:String, gender:String) {
        var friend:[String:String] = [String:String]()
        friend.updateValue(name, forKey: "name")
        friend.updateValue(gender, forKey: "gender")
        addFriend(friendData: friend)
    }
    
    func addFriend(friendData:[String:String])
    {
        if friendList == nil {
            friendList = []
        }
        
        friendList!.append(friendData)
    }
    
    //친구의 이름 리스트 만들기 함수
    func friendNames() -> [String] {
        
        guard let friends = friendList else {
            return []
        }
        
        var returnList:[String] = []
        
        let f1 = friends[0]
        let f2 = friends[1]
        
        let f1Name:String = f1["name"]!
        returnList.append(f1Name)
        
        let f2Name:String = f2["name"]!
        returnList.append(f2Name)
        
        /*
         for friend in friends {
         let name:String = friend["name"]!
         returnList.append(name)
         }
         */
        return returnList
    }
    
    //친구의 이름 모두 출력
    func printFriendName()
    {
        if let friends:[[String:String]] = friendList {
            
            
            for friend:[String:String] in friends {
                
                for (key,value) in friend {
                    if key == "name" {
                        print(value)
                    }
                }
                
                let name:String = friend["name"]!
                //print(name)
            }
            
        }
    }

    
}


