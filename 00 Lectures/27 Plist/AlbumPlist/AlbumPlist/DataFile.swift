//
//  DataFile.swift
//  AlbumPlist
//
//  Created by CLEE on 27/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import Foundation

struct Album {
    var title:String
    var artist:String
    var genre:String
    var songs:[Song]
    
    init(data:[String:Any]) {
        title = data["Album Title"] as? String ?? "무제"
        
        var songList = data["song"] as? [String:Any] ?? [:]
        for song in songList {
            
            songs.append(Song(data:song))
        
        }
    }
    
    
    var dic:[String:Any] {
        var returnDic:[String:Any] = [:]
        returnDic.updateValue(title, forKey: "Album Title")
        
        return returnDic
    }
    
}

struct Song {
    init(data:[String:Any]) {
        
    }
}

class DataFile {
    
    func load() -> Album {
        
        let dic = NSDictionary(contentsOfFile: path) as! [String:Any]
        return Album(data:dic)
        
    }
 
    func save(data:Album) {
    
        var dictionary = NSDictionary(dictionary:data.dic)
        dictionary.write(toFile: path, atomically: true)
    }
}
