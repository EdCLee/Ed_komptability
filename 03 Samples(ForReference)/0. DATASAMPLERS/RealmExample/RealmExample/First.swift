//
//  First.swift
//  RealmExample
//
//  Created by CLEE on 28/06/2017.
//  Copyright © 2017 giftbot. All rights reserved.
//

import Foundation
import RealmSwift

class First: Object {

    let name:String = ""
    let ignore:String = ""
// Specify properties to ignore (Realm won't persist these)
    
    override static func ignoredProperties() -> [String] {
      return ["ignore"]
    }

}

class Second {
    let name:String = ""
}
