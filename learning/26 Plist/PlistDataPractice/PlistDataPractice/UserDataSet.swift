//
//  DataSet.swift
//  PlistDataPractice
//
//  Created by CLEE on 19/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import Foundation

class UserDataSet {
    
    private static let instance:UserDataSet = UserDataSet()
    private var userDataSet:[String:Any]?
    
    
    //sington instance
    class var standard:UserDataSet {
        return instance
    }
    
    
    func object(forKey defaultName:String) -> Any? {
        guard let data = userDataSet else {
            return nil
        }
        return data[defaultName]
    }
    
    
    func set(_ value:Any?, forKey defaultName:String){
        guard let _ = userDataSet, let dataTemp = value else {
            return
        }
        return userDataSet![defaultName] = dataTemp
    }
    
    
    func removeObject(forKey defaultName:String) {
        guard let _ = userDataSet else {
            return
        }
        userDataSet!.removeValue(forKey: defaultName)
        
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
        
        userDataSet = NSDictionary(contentsOfFile: realPath) as? [String:Any]
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
