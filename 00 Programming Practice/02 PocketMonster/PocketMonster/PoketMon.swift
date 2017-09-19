//
//  PoketMon.swift
//  PocketMonster
//
//  Created by CLEE on 18/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//


import Foundation

class PoketMon {
    let name:String
    let type:String
    
    // Optional이 아니니 기본값을 줄때는 여기서 선언.
    var status:PokemonStatus = PokemonStatus.normal
    var hp:Int = 100
    
    var skills:[[String:Any]]?
    var level:Int = 1
    var exp:Int = 0
    var ownerTrainer:Trainer?
    
    
    init(name:String, type:String, status: PokemonStatus) {
        self.name = name
        self.type = type
        self.status = status
    }
    
    // MARK: 공격
    func attck(toMonster monster:PoketMon, skill skillNum:Int)
    {
        if let skillList = skills {
            let skill:[String:Any] = skillList[skillNum]
            
            // PowerPoint 갯수 체크. 0보다 작으면 원하는 스킬 사용 불가!
            if (skill["PowerPoint"] as! Int) > 0 {
                let skillName:String = skill["name"] as! String
                /* as : 다운 케스팅*/
                print("\(self.name)이 \(monster.name)에게 \(skillName)으로 공격합니다.")
                let skillDamage:Int = skill["damage"] as! Int
                monster.hp -= skillDamage
            }else{
                print("스킬포인트 없쪙")
            }
        }else{
            print("스킬 없쪙")
        }
    }
    
    // MARK: 도망
    func runAway(fromMonster monster:PoketMon){
        
    }
    
    
    
}

// MARK: 상태
enum PokemonStatus {
    case dead
    case moral
    case normal
    case poisoned
    case paralyzed
}
