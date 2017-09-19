//
//  DataCenter.swift
//  PlistPractice
//
//  Created by 박종찬 on 2017. 6. 21..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import Foundation



class DataCenter {
    static let instance: DataCenter = DataCenter.init()
    
    var dataArray: [CellData] = []
    
    
    init() {
        let path = Bundle.main.path(forResource: "Sample", ofType: "plist")
        let array: [[String:Any]]? = NSArray(contentsOfFile: path!) as? [[String : Any]]
        
        if let array = array {
            for dictionary in array {
                dataArray.append(CellData(withDictionary: dictionary))
            }
        }
        print(dataArray)
    }
    
}

enum CellType: String {
    case basic = "basic"
}


struct CellData {
    let title: String
    let type: CellType
    let subTitle: String?
    
    init(withDictionary dict: [String:Any]) {
        self.title = dict["title"] as! String
        self.type = CellType.init(rawValue: dict["cellType"] as! String)!
        self.subTitle = dict["subTitle"] as? String ?? nil
    }
    
}
