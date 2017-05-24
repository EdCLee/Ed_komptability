//
//  ViewController.swift
//  CollatzConjecture
//
//  Created by CLEE on 24/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit


// Collatz Conjecture
// 임의의 1이 아닌 자연수 N에 대하여
// 1. 짝수라면 2를 나누고 홀수라면 3을 곱하고 1을 더한다.
// 2. 1이 될때까지 반복하고 반복한 횟수 출력
// value = 271493
class ViewController: UIViewController {
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var displayInfo: UILabel!
    
    
    
//viewDidLoad()////////////////////////////////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
//WorkSpace/////////////////////////////////////////////////////////////////////
    func doColatzConjecture(number num:Int) -> Int {
        var number:Int = 0
        var count:Int = 0
        
        while number != 1{
            if number % 2 == 0 {
               number = number / 2
            }else{
                number = number * 3 + 1
            }
            count = count + 1
        }
        return count
    }
    
    //MARK: 재귀함수를 이용한 방법
//    func collatz(n:Int) -> Int {
//        if n == 1 {
//            return 0
//        }else {
//            if n % 2 == 0 {
//                return 1 + collatz(n: n/2)
//            }else {
//                return 1 + collatz(n: (n*3)+1)
//            }
//        }
//    }

    
    @IBAction func calculateButtonTouch(_ sender: Any) {
        let inputNumber:Int? = Int(inputTextField.text!)
        
        if let number = inputNumber {
            let result:Int = self.doColatzConjecture(number: number)
            self.displayInfo.text = "정답은 \(result) 입니다."
        }
        
    }

}

//self.refreshButton.rotate360Degrees()
