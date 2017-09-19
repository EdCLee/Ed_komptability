//
//  DataCenter.swift
//  MoviePlistProject
//
//  Created by 박종찬 on 2017. 6. 22..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import Foundation

class DataCenter {
    private static let sharedInstance: DataCenter = DataCenter.init()
    
    var movieDataArray: [MovieData] = []
    
    static var defaultCenter: DataCenter {
        get {
            return sharedInstance
        }
    }
    
    
    init() {
        let path: String = Bundle.main.path(forResource: "MovieList", ofType: "plist")!
        let rootArray: [[String:Any]] = NSArray(contentsOfFile: path) as! [[String:Any]]
        
        
        for movieDictionary in rootArray {
            movieDataArray.append(MovieData.init(with: movieDictionary))
        }
        
        
    }
    
    
}
