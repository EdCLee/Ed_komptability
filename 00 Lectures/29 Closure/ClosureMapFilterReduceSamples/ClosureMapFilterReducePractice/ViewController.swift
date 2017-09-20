//
//  ViewController.swift
//  ClosureMapFilterReducePractice
//
//  Created by CLEE on 26/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let digitNames = [1,2,3,4,5]
        
        // map
        let usingMap = digitNames.map { (number) -> String in
            var sampler = ""
            for _ in 0..<number {
                sampler += "*"
            }
            return sampler
        }
        
        print(usingMap)
        
        
        // filter
        let usingFilter = digitNames.filter { (number) -> Bool in
            return number % 2 == 0
        }
        
        print(usingFilter)
    
    
        // reduce
        let digitNamesForResuce = 1...10
        
        let usingReduce = digitNamesForResuce.reduce(0) { (num1, num2) -> Int in
            num1 + num2
        }
        
        print(usingReduce)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

