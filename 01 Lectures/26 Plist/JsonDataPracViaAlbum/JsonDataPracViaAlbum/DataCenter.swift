//
//  DataCenter.swift
//  JsonDataPracViaAlbum
//
//  Created by CLEE on 22/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import Foundation

class DataCenter {
    
    private static let sharedInstance: DataCenter = DataCenter()
    
    var movieDataArray:[MovieData] = []
    
    static var defaultCenter: DataCenter {
        get {
            return DataCenter.sharedInstance
        }
    }
    
    init() {
        let path:String = Bundle.main.path(forResource: "MovieList", ofType: "plist")!
        let rootArray: [[String:Any]] = NSArray(contentsOfFile: path) as! [[String:Any]]
        
        movieDataArray = []
        
        for movieDictionary in rootArray {
            movieDataArray.append(MovieData.init(with: movieDictionary))
        }
        
    }
    
    
    
}
