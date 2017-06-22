//
//  MovieData.swift
//  JsonDataPracViaAlbum
//
//  Created by CLEE on 22/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import Foundation

struct MovieData {
    let title: String
    let year: Int
    let genre: [MovieGenre]
    let director:[String]
    let stars:[String]
    let posterURL:String
    
    init(with dictionary: [String:Any]) {
        self.title = dictionary["title"] as? 
    }
}
