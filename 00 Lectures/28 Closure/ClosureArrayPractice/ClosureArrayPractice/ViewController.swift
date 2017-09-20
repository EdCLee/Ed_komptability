//
//  ViewController.swift
//  ClosureArrayPractice
//
//  Created by CLEE on 26/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numArray:[Int] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Int 배열을 String 배열로 바꾸기
        let dataArray:([Int]) -> [String] = {(inputArray:[Int]) -> [String] in
            var resultArray:[String] = []
            
            for index in inputArray {
                resultArray.append(String(index))
                //resultArray.append("\(num)")
            }
            return resultArray
        }
        
        print(dataArray([3,2,1,4,5,6,7]))
        
        // Int 배열의 데이터중 짝수만 구하기
        let numArray:([Int]) -> [Int] = {(inputNum:[Int]) -> [Int] in
            var resultArray:[Int] = []
            
            for index in inputNum {
                if index % 2 == 0 {
                    resultArray.append(index)
                }
            }
            return resultArray
        }
        
        print(numArray([3,2,1,4,5,6,7,8]))
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

