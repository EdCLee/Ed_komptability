//
//  DataCenter.swift
//  TwitterDynamicCellPractice
//
//  Created by 박종찬 on 2017. 7. 13..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import Foundation

class DataCenter {
    
    static let shared: DataCenter = DataCenter.init()
    
    private var rawArray: [Twit] = []
    
    var dataArray: [Twit] {
        get {
            return rawArray
        }
    }
    
    
    private init() {
        loadFromBundle()
        
    }
    
    private func loadFromBundle() {
        let bundlePath: String = Bundle.main.path(forResource: "DataFromServer", ofType: "plist")!
        if let loadedArray = NSArray.init(contentsOfFile: bundlePath) as? [[String:String]] {
            self.rawArray = loadedArray.map({ (dictionary: [String:String]) -> Twit in
                return Twit.init(with: dictionary)
            })
        }
    }
    
}


class Twit {
    let userName: String
    let userId: String
    let userPhotoUrl: String
    let bodyText: String
    var imageUrl: String?
    
    init(with dictionary: [String:String]) {
        //딕셔너리를 이용해서 Twit을 만들수 있도록 해 놓으세요. 아래는 딕셔너리 키값입니다.
        //user_id
        //user_name
        //user_profile_img_url
        //body_text
        //img_url
        
        self.userId = dictionary["user_id"]!
        self.userName = dictionary["user_name"]!
        self.userPhotoUrl = dictionary["user_profile_img_url"]!
        self.bodyText = dictionary["body_text"]!
        self.imageUrl = dictionary["img_url"] ?? nil
    }
}
