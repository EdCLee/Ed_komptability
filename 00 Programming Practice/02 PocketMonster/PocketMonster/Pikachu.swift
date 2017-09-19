//
//  Pikachu.swift
//  PocketMonster
//
//  Created by CLEE on 17/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import Foundation

//피카츄
class Pikachu:PoketMon {
    init() {
        super.init(name:"피카츄", type:"전기", status:PokemonStatus.normal)
        hp = 110
        skills = [["name":"몸통박치기","damage":10,"속성":"노멀","PowerPoint":20],
                  ["name":"전기충격","damage":30,"속성":"전기","PowerPoint":10],
                  ["name":"10만볼트","damage":80,"속성":"전기","PowerPoint":5]]
    }
    
    // MARK: 부모의 init을 사용하기 전까지는 self 라는 것 자체가 없는 껍데기인 init 함수.
    override init(name:String, type:String, status:PokemonStatus) {
        // super를 사용함으로써 부모의 init을 사용하고 부모의 프로퍼티 및 함수를 물려받는다.
        super.init(name:name, type:type, status:status)
    }
    
    // MARK: 진화
    func evolution() -> Raichu? {
        if exp >= 100 {
            let newRaichu:Raichu = Raichu()
            return newRaichu;
        }
        return nil
    }
}
