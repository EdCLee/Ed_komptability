//
//  ViewController.swift
//  CLosurePractice
//
//  Created by CLEE on 23/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let add = {(f:Int, s:Int) -> Int in f + s}
        let minus = {(f:Int, s:Int) -> Int in f - s}
        let multify = {(f:Int, s:Int) -> Int in f * s}
        let divide = {(f:Int, s:Int) -> Int in f / s}
        
        print(calculation(num1: 10, num2: 15, op: add))
        print(calculation(num1: 10, num2: 15, op: minus))
        print(calculation(num1: 10, num2: 15, op: multify))
        print(calculation(num1: 10, num2: 5, op: divide))
        
        // Trailing Closure for a last parameter
        print(calculation(num1: 1, num2: 2) {$0 + $1})
        
        print(calculation(num1: 10, num2: 12, op: +))
        
        
        testActionWithCompletion({(isSuccess) in
            if isSuccess {
                print("Succeeeeeeeeess!!")
            }else {
                
            }
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //File안에 존재한다고 가정
    //외부 argument 는 _, 외부 parameter는 completion, 타입은 closure인 함수.
    func testActionWithCompletion(_ completion:(Bool) -> Void) {

        print("함수 실행")
        
        //conditino
        if true {
        
            completion(true)
            
        }else {
            completion(false)
        }
    }


    func calculation(num1:Int, num2:Int, op:(Int,Int) -> Int) -> Int {
        return op(num1,num2)
        
    }
    
}
