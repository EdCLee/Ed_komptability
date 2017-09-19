//
//  Trainer.swift
//  PocketMonster
//
//  Created by CLEE on 18/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import Foundation

class Trainer {
    var myPoketMons:[PoketMon] = []
    var name:String
    
    init(name:String) {
        self.name = name
    }

    func catchPoketMon(targetMonster monster:PoketMon) {
        myPoketMons.append(monster)
        monster.ownerTrainer = self
    }
    
}
