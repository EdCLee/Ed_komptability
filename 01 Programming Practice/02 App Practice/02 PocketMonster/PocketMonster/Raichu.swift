//
//  Raichu.swift
//  PocketMonster
//
//  Created by CLEE on 18/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import Foundation

class Raichu:Pikachu {
    
    override init() {
        super.init(name:"라이츄", type:"전기", status:PokemonStatus.normal)
        hp = 210
        skills = [["name":"몸통박치기","demage":20,"속성":"노멀","PowerPoint":30],
                  ["name":"10만볼트","demage":100,"속성":"전기","PowerPoint":10],
                  ["name":"100만볼트","demage":150,"속성":"전기","PowerPoint":5]]
        
    }
    
    override init(name:String, type:String, status:PokemonStatus) {
        super.init(name: name, type: type, status: status)
    }
    
    override func evolution() -> Raichu {
        return self
    }
    
}
