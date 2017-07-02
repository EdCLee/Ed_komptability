//
//  DataCenter.swift
//  FriendList
//
//  Created by CLEE on 30/06/2017.
//  Copyright © 2017 WingsCompany. All rights reserved.
//

import UIKit

class DataCenter {
   
    static let shared: DataCenter = DataCenter.init()

    //TYPE A
//    var dataArray:[Person] = []
    
    // 데이터에 접근을 제어하기 위해 사용한다.
//    static var defaultCenter:DataCenter {
//        get {
//            return shared
//        }
//    }
    
    //TYPE A
//    private init() {
//        
//    }
    
    //TYPE A
    // 데이터가 해야할 일,
    // load를 가장먼저 호출하기 위해 init() 에 load()를 넣는다.
//    private init() {
//        let bundlePath = Bundle.main.path(forResource: "Person", ofType: "plist")
//        if let loadedArray = NSArray.init(contentsOfFile: bundlePath!) as? [[String:Any]] {
//            self.dataArray = loadedArray.map({ (dictionary:[String:Any]) -> Person in
//                return Person.init(withDictionary: dictionary)
//            })
//            
//        }
//    }

    
    //TYPE B
    
    private var rawArray : [Person]!
    
    var dataArray:[Person] {
        get {
            return rawArray
        }
    }
    
    
    let fileManager:FileManager = FileManager.init()
    let docPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, .userDomainMask, true).last! + "/Person.plist"
    
    
    //TYPE B
    private init() {
        if fileManager.fileExists(atPath: docPath) {
            loadFromDoc()
        } else {
            loadFromBundle()
        }
        // 이 시점에 데이터 파일에 데이터가 최소 1개 있다.
    }
    
    //TYPE B
    private func loadFromBundle() {
        let bundlePath = Bundle.main.path(forResource: "Person", ofType: "plist")!
        if let loadedArray = NSArray.init(contentsOfFile: bundlePath) as? [[String:Any]] {
            parsePersons(loadedArray)
        }
        // 이 시점에 추가.
        try? fileManager.copyItem(atPath: bundlePath, toPath: docPath)

    }
    
    private func loadFromDoc() {
        if let loadedArray = NSArray.init(contentsOfFile:docPath) as? [[String:Any]] {
            parsePersons(loadedArray)
        }
    }
    
    private func parsePersons(_ array:[[String:Any]]) {
        self.rawArray = array.map({ (dictionary:[String:Any]) -> Person in
            return Person.init(withDictionary : dictionary)
        })
    }
    
    // save는 위의 과정을 반대로
    private func saveToDoc() {
        let nsArray:NSArray = NSArray.init(array: self.rawArray.map({ (person : Person) -> [String:Any] in
            return person.dictionary
        }))
        nsArray.write(toFile: docPath, atomically: true)
    }
    
    func addPerson(_ dict:[String:Any]) {
        self.rawArray.append(Person.init(withDictionary: dict))
        
        self.saveToDoc()
    }
    
}
