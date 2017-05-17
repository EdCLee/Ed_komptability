//
//  Pikachu.swift
//  PocketMonster
//
//  Created by CLEE on 17/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import Foundation

class Pikachu { //피카츄
    var name:String
    var hp:Int = 110
    var type:String = "전기"
    var skills:[[String:Any]] = [["name":"전기충격","demage":10],["name":"몸통박치기","demage":20]]
    
    init() {
        
        name = "피카츄"
    }
    
    func attck(toMoster monster:Pikachu, skill skillNum:Int)
    {
        
        let skill:[String:Any] = skills[skillNum]
        let skillName:String = skill["name"] as! String
        
        /* as : 다운 케스팅*/
        print("\(self.name)이 \(targetName)에게 \(skillName)으로 공격합니다.")
        
        let skillDemage:Int = skill["demage"] as! Int
        monster.hp -= skillDemage
        
    }
}
