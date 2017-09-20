//
//  ViewController.swift
//  DailyFuncPrac
//
//  Created by CLEE on 17/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func queButton(_ sender: UIButton) {
        
        // 옵셔널!로 숫자값이 있다고 보증해 줌.
        // 제한조건. 숫자만 받을 수 있게 처리하는것은 여기서. alert
        let numb:Int = Int(self.inputTextField.text!)!
        //self.isEven(number: numb)
        self.getDivisor(number: numb)
        
    }

//    // MARK: 홀짝수 판별기
//    func isEven(number numb:Int) {
//        if numb % 2 == 0 {
//            self.resultLabel.text = "Yes! It's even number."
//        }else{
//            self.resultLabel.text = "No! put some other number."
//        }
//    }
    
    // MARK: 약수의 합
    // 단, 1과 자기자신은 합에서 제외.
    func getDivisor(number numb:Int){
        var result = 0
        
        if numb <= 2 {
            self.resultLabel.text = "Wrong Integer"
        }else {
            for i in 2..<numb {
                if numb % i == 0 {
                    result += i
                }
            }
            // return 해서 값을 저장하는 대신 프린트로 값을 반환하는 것.
            self.resultLabel.text = "\(numb)의 결과는 \(result)입니다."
        }
    }
    
    // MARK: 2 보다 큰 양의 정수에 대한
}














