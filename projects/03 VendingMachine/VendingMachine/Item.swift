//
//  Item.swift
//  VendingMachine
//
//  Created by CLEE on 22/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import Foundation

class Item {
    var itemName:String ; var itemPrice:Int
    
    init(itemName:String, itemPrice:Int) {
        self.itemName = itemName
        self.itemPrice = itemPrice
    }
}
