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
        
        let digitNumbers = {(numberSet:Int) -> [Int] in
            var resultArray:[Int] = []
            
            for index in 1...numberSet {
                resultArray.append(index)
            }
            return resultArray
        }
        print(digitNumbers(10))
        
        
        //구구단 구하는 클로저: (Int) -> [Int]
        let multiflicationTable:(Int) -> [Int] = {(times:Int) -> [Int] in
            var resultArray:[Int] = []
            
            for index in digitNumbers(9) {
                resultArray.append(times * index)
            }
            return resultArray
            
        }
        
        print(multiflicationTable(8))

        
        // Factorial 구하기
        let reduceFactorial = digitNumbers(5).reduce(1) {(num1, num2) -> Int in
            num1 * num2
        }
        print("\(digitNumbers) Factorial is \(reduceFactorial)")

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

