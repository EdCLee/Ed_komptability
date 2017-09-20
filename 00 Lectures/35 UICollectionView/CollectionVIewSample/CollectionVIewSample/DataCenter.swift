//
//  DataCenter.swift
//  CollectionVIewSample
//
//  Created by CLEE on 03/07/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import Foundation

class DataCenter {
    static let center = DataCenter()
    
    var friendList = ["1", "2", "3", "4", "5", "6", "7", "8", "9",
                      "0", "A", "B", "C", "D", "E", "F", "G", "H",
                      "I", "J", "K", "L", "M", "N", "O", "P", "Q",
                      "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
                      "!", "@", "#", "$", "%", ",", ".", "+", "-",
                      "="]
    
    
    func insertItems(at items:[IndexPath]) {
    
        let sortedItem = items.sorted(by:>)
        
        let tempList:[String] = items.map { (indexPath:IndexPath) -> String in
            friendList[indexPath.item]
        }
//        .sorted(by: <)
        friendList.insert(contentsOf: tempList, at: sortedItem.last!.item + 1)
//        friendList += tempList
    }
    
}
