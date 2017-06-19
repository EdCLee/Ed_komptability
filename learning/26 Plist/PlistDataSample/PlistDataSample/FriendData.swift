//
//  FriendData.swift
//  PlistDataSample
//
//  Created by CLEE on 19/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import Foundation

class FriendData {
    private let fileName = "FriendData"
    private let fileType = "plist"
    
    private static let instance:FriendData = FriendData()
    private var friendData:[String:AnyObject]?
    
    //싱글톤 인스턴스
    class var standard: FriendData {
        return instance
    }
    
    
    func object(forKey defaultName:String) -> AnyObject? {
        guard let data = friendData else {
            return nil
        }
        return data[defaultName]
    }
    
    
    func set(_ value: AnyObject?, forKey defaultName: String) {
        guard let _ = friendData, let vvvv = value else {
            return
        }
        
        friendData![defaultName] = vvvv
    }
    
    
    func removeObject(forKey defaultName:String) {
        guard let _ = friendData else {
            return
        }
        friendData!.removeValue(forKey: defaultName)
    }
    
    
    func friendDataSave() {
        save()
    }
    
    
    private init() {
        load()
    }
    
    deinit {
        save()

    }
    
    
    //load
    private func load() {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let realPath = path[0] + "/FriendList.plist"
        
        friendData = NSDictionary(contentsOfFile: realPath) as? [String:AnyObject]
    }
    
    
    //save
    private func save() {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let realPath = path[0] + "/FriendList.plist"
        
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: realPath) {
            if let bundlePath = Bundle.main.path(forResource: fileName, ofType: fileType) {
                do {
                    try fileManager.copyItem(atPath: bundlePath, toPath: realPath)
                } catch {
                    return
                }
            }
        }
    }
}
