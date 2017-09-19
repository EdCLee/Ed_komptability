//
//  DataCenter.swift
//  personManageProgramming
//
//  Created by 김태형 on 2017. 6. 26..
//  Copyright © 2017년 김태형. All rights reserved.
//

//import Foundation
//
//struct Album {
//    
//    var title:String
//    var artist:String
//    var genre:String
//    var songs:[Song]
//    
//    init(data:[String:Any]) {
//        title = data["title"] as? String ?? ""
//        let songList = data["song"] as? [[String:Any]] ?? []
//        for song in songList
//        {
//            songs.append(Song(data:song))
//        }
//    }
//    // 받아온 데이터를 인스턴스화
//    
//    var dic:[String:Any]
//    {
//        var returnDic:[String:Any] = [:]
//        returnDic.updateValue(title, forKey: "AlbumTitle")
//        return returnDic
//    }
//    // 인스턴스를 딕셔너리 형태의 데이터화 요 밑에 DataFile class에 save 펑션으로 저장한다.
//}
//
//class DataFile{
//    
//    func load()
//    {
//        let dic = NSDictionary(contentsOfFile: path) as! [String:Any]
//        return Album(data: dic)
//    }
//    
//    func save()
//    {
//        var dictionary = NSDictionary(dictionary: data.dic)
//        dictionary.write(toFile:path)
//    }
//}
//
//struct Song {
//    init(data:[String:Any]) {
//        <#statements#>
//    }
//    
//}


//
//class DataCenter {
//    var firstData:FirstViewData?
//    var secondData:SecondViewData?
//    
//    
//    init(with dictionary: [String:Any])
//    {
//        let info = dictionary["firstViewData"]
//        for i in info
//        {
//            firstData =
//        }
//    }
//    
//    
//}
//
//class FirstViewData {
//    
//    static var data = FirstViewData()
//    
//    var name:String?
//    var gender:Gender?
//    var dataArray:[String:Any]
//
//    
//    init()
//    {
//        loadData()
//    }
//    
//    func loadData()
//    {
//        let data = Bundle.main.path(forResource: "FriendList", ofType: "plist") as! String
//        let dataArray = NSDictionary(contentsOfFile: data) as! [String:Any]
//        
//        
//        
//    
//    }
//    
//}
//
//
//struct SecondViewData {
//    
//    var name:String?
//    var gender:Gender?
//    var dataArray:[String:Any]
//    
//    static var data = SecondViewData()
//    
//    
//    
//    init()
//    {
//        loadData()
//    }
//    
//    func loadData()
//    {
//        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
//        let basePath = path[0] + "/FriendList.plist"
//        
//        if !FileManager.default.fileExists(atPath: basePath)
//        {
//            if let fileUrl = Bundle.main.path(forResource: "FriendList", ofType: "plist")
//            {
//                do{
//                    try FileManager.default.copyItem(atPath: fileUrl, toPath: basePath)
//                }catch{
//                    print("fail")
//                }
//            }
//        }
//       
//        
//    }
//    
//    static func save()
//    {
//        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
//        let basePath = path[0] + "/FriendList.plist"
//        let dict = NSDictionary(contentsOfFile: basePath) as? [String:Any]
//        let realDict = dict[
//    }
//    
//    
//}
//
//
//enum Gender {
//    case Male
//    case Female
//    case All
//}
