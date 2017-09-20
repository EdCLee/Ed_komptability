//
//  ViewController.swift
//  ClosureExample
//
//  Created by CLEE on 14/07/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //default
//        let q1 = DispatchQueue(label: "com.closureExample.q1")
//        
//        q1.async {
//            for n in 1..<100 {
//                print(n)
//            }
//        }
//        
//        q1.async {
//            for n in 100...200 {
//                print(n)
//            }
//        }
        
        
        
        let q2 = DispatchQueue(label: "com.closureExample.q2", qos: .userInteractive)
        let q3 = DispatchQueue(label: "com.closureExample.q3", qos: .userInitiated)
        let q4 = DispatchQueue(label: "com.closureExample.q4", qos: .default)
        let q5 = DispatchQueue(label: "com.closureExample.q5", qos: .utility)
        let q6 = DispatchQueue(label: "com.closureExample.q6", qos: .background)
        let q7 = DispatchQueue(label: "com.closureExample.q7", qos: .unspecified)
        
        //attribute에 .concurrent를 입력하면 병렬 thread가 가능.
        //let q8 = DispatchQueue(label: "com.closureExample.q8", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency, target: DispatchQueue?)
        
        //userInteractive
        q2.async {
            for n in 200..<300 {
            print("\(n) : userInteractive")
            }
        }
        
        //userInitiated
        q3.async {
            for n in 300..<400 {
            print("\(n) :  userInitiated")
            }
        }
        
        //default
        q4.async {
            for n in 400..<500 {
            print("\(n) :   default")
            }
        }
        
        //utility
        q5.async {
            for n in 500..<600 {
            print("\(n) :    utility")
            }
        }
        
        //background
        q6.async {
            for n in 600..<700 {
            print("\(n) :     background")
            }
        }
        
        //unspecified
        q7.async {
            for n in 700..<800 {
            print("\(n) :      unspecified")
            }
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

