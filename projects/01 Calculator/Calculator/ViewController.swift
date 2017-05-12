//
//  ViewController.swift
//  Calculator
//
//  Created by CLEE on 10/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

// 작업 중 코드를 지우게 되면 꼭 스토리보드에 가서 해당하는 UI도 수정/삭제 할것.
// ## tips
// tag : 태그기능. 숫자만 입력이 가능하며 Controller에서 태그를 호출할 수 있다.
//계산기에서 버튼 0에 해당하는 함수이다.
//@IBAction func touch0(_ sender: UIButton) {
//    print("0")
//    displayOutlet.text = displayOutlet.text! + String(sender.tag-1)
//}
//
//tag의 기본값은 0이며 프로그래밍에 있어 0은 오류를 발생 시킬 수 있는 숫자이므로 태그에 +1을 하였고, 함수에서 -1을 적용시켜 숫자 0 버튼을 눌렀을 시 0 값이 들어갈 수 있게 설정 하였다.
//* 가능한한 사용하지 않는것을 추천.

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //@IBOutlet은 UI에 연결시켜주는 커넥터
    @IBOutlet weak var displayOutlet: UILabel!
    
    //UIButton 생성은 스토리보드에서 control + drag로 ViewController에 생성 가능하다.
    @IBAction func touch0(_ sender: UIButton) {
        print("0")
        displayOutlet.text = displayOutlet.text! + String(sender.tag-1)
    }
    //UIButton sender는 내부에서 작동하는 것
    @IBAction func touch1(_ sender: UIButton) {
        print("1")
        let displayingText: String = self.displayOutlet.text!
        self.displayOutlet.text = displayingText + "1"
    }
    @IBAction func touch2(_ sender: UIButton) {
        print("2")
        let displayingText: String = self.displayOutlet.text!
        self.displayOutlet.text = displayingText + "2"
    }
    @IBAction func touch3(_ sender: UIButton) {
        print("3")
        let displayingText: String = self.displayOutlet.text!
        self.displayOutlet.text = displayingText + "3"
    }
    @IBAction func touch4(_ sender: UIButton) {
        print("4")
        let displayingText: String = self.displayOutlet.text!
        self.displayOutlet.text = displayingText + "4"
    }
    @IBAction func touch5(_ sender: UIButton) {
        print("5")
        let displayingText: String = self.displayOutlet.text!
        self.displayOutlet.text = displayingText + "5"
    }
    @IBAction func touch6(_ sender: UIButton) {
        print("6")
        let displayingText: String = self.displayOutlet.text!
        self.displayOutlet.text = displayingText + "6"
    }
    @IBAction func touch7(_ sender: UIButton) {
        print("7")
        let displayingText: String = self.displayOutlet.text!
        self.displayOutlet.text = displayingText + "7"
    }
    @IBAction func touch8(_ sender: UIButton) {
        print("8")
        let displayingText: String = self.displayOutlet.text!
        self.displayOutlet.text = displayingText + "8"
    }
    @IBAction func touch9(_ sender: UIButton) {
        print("9")
        let displayingText: String = self.displayOutlet.text!
        self.displayOutlet.text = displayingText + "9"
    }
    @IBAction func allClear(_ sender: UIButton) {
        print(" AC ")
        self.displayOutlet.text = "0"
    }
    @IBAction func plusMinus(_ sender: UIButton) {
        print(" +/– ")
    }
    @IBAction func percentage(_ sender: UIButton) {
        print(" % ")
    }
    @IBAction func divide(_ sender: UIButton) {
        print(" ÷ ")
    }
    @IBAction func multiply(_ sender: UIButton) {
        print(" x ")
    }
    @IBAction func minus(_ sender: UIButton) {
        print(" – ")
    }
    @IBAction func plus(_ sender: UIButton) {
        print(" + ")
    }
    @IBAction func equal(_ sender: UIButton) {
        print(" = ")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

