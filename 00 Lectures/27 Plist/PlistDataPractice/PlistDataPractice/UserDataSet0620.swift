//
//  UserDataSet0620.swift
//  PlistDataPractice
//
//  Created by CLEE on 20/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import Foundation

//
//  DataSet.swift
//  PlistDataPractice
//
//  Created by CLEE on 19/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import Foundation

class UserDataSet0620 {
    
    private static let instance:UserDataSet0620 = UserDataSet0620()
    private var userDataSet0620:[String:Any]?
    private var userList:[Any]
    
    
    //sington instance
    class var standard:UserDataSet0620 {
        return instance
    }
    
    
    
    
    func add(user:Person) {
        userList?.append(user)
    }
    
    func removeUser() {
        
    }
    
    func updateFriend(newPerson person:Person) {
        let compareKey = person.name
        
        //userList = [Person]
        for user in userList! {
            if user.name == compareKey {
                userList?[index] = person
                break
            }
            index += 1
        }
    }
    
    func allUserList() -> [Person] {
        return userList
    }
    
    func user(name:String) -> Person? {
        for user in userList! {
            if user.name == name {
                return user
            }
        }
    }
    
    
    
    
    func userDataSave() {
        save()
    }
    
    private init() {
        load()
    }
    
    deinit {
        save()
    }
    
    
    
    
    //load()
    func load() {
        let path:[String] = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let realPath = path[0] + "/UserDataSet.plist"
        
        userDataSet0620 = NSDictionary(contentsOfFile: realPath) as? [String:Any]
        
        // 비효율적인 방법이나 plist에 값을 넣는 방법.
        let tempList = userDataSet0620?["list"] as? [Any]

        var newUserList:[Person] = []
        
        for temp in tempList! {
            
            let dic = temp as! [String:Any]
            let p = Person(name:dic["name"] as? String,
                   email:dic["email"] as? String,
                   id:dic["id"] as? String
                   )
            newUserList.append(p)
            
        }
        
        userList = newUserList
        
        //userList = userDataSet0620?["list"] as? [Any]
    }
    
    
    //save()
    func save() {
        let path:[String] = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let realPath = path[0] + "/UserDataSet.plist"
        
        // 값이 없으면!
        if !FileManager.default.fileExists(atPath: "realPath"){
            if let bundlePath = Bundle.main.path(forResource: "UserDataSet", ofType: "plist") {
                do {
                    try FileManager.default.copyItem(atPath: bundlePath, toPath: realPath)
                }catch {
                    print("non defined error")
                    return
                }
            }
            print("no data existing")
            return
        }
        
        //write
        if let userDict = NSDictionary(contentsOfFile: realPath) as? [String:Any] {
            
            var loadData = userDict
            loadData.updateValue("addData", forKey: "key")
            
            let nsDict:NSDictionary = NSDictionary(dictionary: loadData)
            nsDict.write(toFile: realPath, atomically: true)
        }
    }
    
}
