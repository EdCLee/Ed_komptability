//
//  Class1.swift
//  PropertySample
//
//  Created by CLEE on 14/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import Foundation

class Class1 {
    static func testS(){
        
    }
    
    class func testC() {

    }
}

// Class1을 상속받아 같은 메소드를 사용하려하면,
class Class2:Class1 {
    
    // override를 사용해도 재정의가 불가능.
    static func testS (){
        
    }
    
    // override를 통해 재정의가 가능함.
    class func testC() {
        
    }
    
}
