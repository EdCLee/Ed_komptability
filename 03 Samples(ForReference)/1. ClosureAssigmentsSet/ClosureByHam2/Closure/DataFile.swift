//
//  DataFile.swift
//  FriendList
//
//  Created by youngmin joo on 2017. 6. 26..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import Foundation

class DataFile {
    
    static let instance: DataFile = DataFile()
    
    var friendList: [Person] = []
    
    private init() {}

    func saveData(name: String, gender: String, age: String) {
                
        let friend = Person(name: name, gender: gender, age: Int(age)!)
        friendList.append(friend)
    }
    
    func editData(name: String, gender: String, age: String, index: Int) {
        
        let friend = Person(name: name, gender: gender, age: Int(age)!)
        friendList.remove(at: index)
        friendList.insert(friend, at: index)
    }
    
}
