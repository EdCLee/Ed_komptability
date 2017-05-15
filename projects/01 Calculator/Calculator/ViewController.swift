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
    
    var tempFirstNum:Int = 0
    var tempSecondNum:Int = 0
    var tempOperation:String = ""
    
    var displayNumber:String = "0"

//VIEW LIFE CYCLE////////////////////////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//VIEW ACTION////////////////////////////////////////////////////////////
    // @IBOutlet은 UI에 연결시켜주는 커넥터
    @IBOutlet weak var displayOut: UILabel!
    
    // UIButton 생성은 스토리보드에서 control + drag로
    // ViewController에 생성 가능하다.
    
    @IBAction func touch0(_ sender: UIButton) {
        print("0")
        if displayNumber == "0" {
            displayNumber = "0"
        }else{
            displayNumber += "0"
        }
        
        if tempOperation.isEmpty {
            tempFirstNum = Int(displayNumber)!
        }else{
            tempSecondNum = Int(displayNumber)!
        }
        self.displayOut.text = displayNumber
    }

    // UIButton sender는 내부에서 작동하는 것
    @IBAction func touch1(_ sender: UIButton) {
        print("1")
        if displayNumber == "0" {
            displayNumber = "1"
        }else{
            displayNumber += "1"
        }
        
        if tempOperation.isEmpty {
            tempFirstNum = Int(displayNumber)!
        }else{
            tempSecondNum = Int(displayNumber)!
        }
        self.displayOut.text = displayNumber
    }

    @IBAction func touch2(_ sender: UIButton) {
        print("2")
        if displayNumber == "0" {
            displayNumber = "2"
        }else{
            displayNumber += "2"
        }
        
        if tempOperation.isEmpty {
            tempFirstNum = Int(displayNumber)!
        }else{
            tempSecondNum = Int(displayNumber)!
        }
        self.displayOut.text = displayNumber
    }

    @IBAction func touch3(_ sender: UIButton) {
        print("3")
        if displayNumber == "0" {
            displayNumber = "3"
        }else{
            displayNumber += "3"
        }
        
        if tempOperation.isEmpty {
            tempFirstNum = Int(displayNumber)!
        }else{
            tempSecondNum = Int(displayNumber)!
        }
        self.displayOut.text = displayNumber
    }

    @IBAction func touch4(_ sender: UIButton) {
        print("4")
        if displayNumber == "0" {
            displayNumber = "4"
        }else{
            displayNumber += "4"
        }
        
        if tempOperation.isEmpty {
            tempFirstNum = Int(displayNumber)!
        }else{
            tempSecondNum = Int(displayNumber)!
        }
        self.displayOut.text = displayNumber
    }

    @IBAction func touch5(_ sender: UIButton) {
        print("5")
        if displayNumber == "0" {
            displayNumber = "5"
        }else{
            displayNumber += "5"
        }
        
        if tempOperation.isEmpty {
            tempFirstNum = Int(displayNumber)!
        }else{
            tempSecondNum = Int(displayNumber)!
        }
        self.displayOut.text = displayNumber
    }

    @IBAction func touch6(_ sender: UIButton) {
        print("6")
        if displayNumber == "0" {
            displayNumber = "6"
        }else{
        displayNumber += "6"
        }
        
        if tempOperation.isEmpty {
            tempFirstNum = Int(displayNumber)!
        }else{
            tempSecondNum = Int(displayNumber)!
        }
        self.displayOut.text = displayNumber
    }

    @IBAction func touch7(_ sender: UIButton) {
        print("7")
        if displayNumber == "0" {
            displayNumber = "7"
        }else{
            displayNumber += "7"
        }
        
        if tempOperation.isEmpty {
            tempFirstNum = Int(displayNumber)!
        }else{
            tempSecondNum = Int(displayNumber)!
        }
        self.displayOut.text = displayNumber
    }
    
    @IBAction func touch8(_ sender: UIButton) {
        print("8")
        if displayNumber == "0" {
            displayNumber = "8"
        }else{
            displayNumber += "8"
        }
        
        if tempOperation.isEmpty {
            tempFirstNum = Int(displayNumber)!
        }else{
            tempSecondNum = Int(displayNumber)!
        }
        self.displayOut.text = displayNumber
    }
    
    @IBAction func touch9(_ sender: UIButton) {
        print("9")
        if displayNumber == "0" {
            displayNumber = "9"
        }else{
            displayNumber += "9"
        }
        
        if tempOperation.isEmpty {
            tempFirstNum = Int(displayNumber)!
        }else{
            tempSecondNum = Int(displayNumber)!
        }
        self.displayOut.text = displayNumber
    }
    
    @IBAction func touchPoint(_ sender: UIButton) {
        print("0")
        displayNumber = String(format: "%.2f", Double(tempFirstNum) / 10.0)
        
        displayOut.text = displayNumber

    }
    
    @IBAction func allClear(_ sender: UIButton) {
        print(" AC ")
        tempFirstNum = 0
        tempSecondNum = 0
        displayNumber = "0"
        
        displayOut.text = displayNumber
        
    }
    @IBAction func plusMinus(_ sender: UIButton) {
        print(" +/– ")
//        tempFirstNum = 0
//        tempOperation = "+/-"
        displayNumber = String(Int(tempFirstNum) * -1)
        
        displayOut.text = "\(displayNumber)"
    }
    @IBAction func percentage(_ sender: UIButton) {
        print(" % ")
        tempFirstNum = 0
//        tempOperation = "%"
        displayNumber = String(format: "%.2f", Double(tempFirstNum) / 100.0)
        
        displayOut.text = "\(displayNumber)"
    }
    @IBAction func divide(_ sender: UIButton) {
        print(" ÷ ")
        tempOperation = "/"
        displayNumber = "0"
    }
    @IBAction func multiply(_ sender: UIButton) {
        print(" x ")
        tempOperation = "*"
        displayNumber = "0"
    }
    @IBAction func minus(_ sender: UIButton) {
        print(" – ")
        tempOperation = "-"
        displayNumber = "0"
    }
    @IBAction func plus(_ sender: UIButton) {
        print(" + ")
        tempOperation = "+"
        displayNumber = "0"
        
    }
    @IBAction func equal(_ sender: UIButton) {
        print(" = ")
        
        var resultValue = 0
        switch tempOperation {
        case "+":
            resultValue = processPlus(firstNum: tempFirstNum, secondNum: tempSecondNum)
        case "-":
            resultValue = processMinus(firstNum: tempFirstNum, secondNum: tempSecondNum)
        case "*":
            resultValue = processMultiply(firstNum: tempFirstNum, secondNum: tempSecondNum)
        case "/":
            resultValue = processDivide(firstNum: tempFirstNum, secondNum: tempSecondNum)
//        case "%":
//            resultValue = processPercentage(firstNum: tempFirstNum)
//        case "+/-":
//            resultValue = processPlusMinus(firstNum: tempFirstNum)
//        case "AC":
//            resultValue = processAllClear(firstNum: tempFirstNum, secondNum: tempSecondNum)
            
        default:
            resultValue = 0
        }
        displayOut.text = "\(resultValue)"
        
        tempFirstNum = resultValue
        tempSecondNum = 0
        tempOperation = ""
        displayNumber = "0"
        
        print("tempFirstNum === \(tempFirstNum)")
        print("resultValue === \(resultValue)")
    }
    
//CALCULATION METHOD/////////////////////////////////////////////////////
    
    // 더하기 함수
    func processPlus(firstNum:Int, secondNum:Int) -> Int {
        return firstNum + secondNum
    }
    
    // 빼기 함수
    func processMinus(firstNum:Int, secondNum:Int) -> Int {
        print(processPlus)
        return firstNum - secondNum
    }
    
    // 곱하기 함수
    func processMultiply(firstNum:Int, secondNum:Int) -> Int {
        return firstNum * secondNum
    }
    
    // 나누기 함수
    func processDivide(firstNum:Int, secondNum:Int) -> Int {
        return firstNum / secondNum
    }
    
//    // 퍼센트
//    func processPercentage(firstNum:Int) -> Int {
//        return firstNum / 100
//    }
//    
//    //양수/음수
//    func processPlusMinus(firstNum:Int) -> Int {
//        return firstNum * -1
//    }
//    
//    //지우기
//    func processAllClear(firstNum:Int, secondNum:Int) -> Int {
//        print("processAllClear ==== \(processAllClear)")
//        return 0
//    }
}
// 앞에 먼저 계산된 결과값에 연산은 안됨.

//QUESTIONS//////////////////////////////////////////////////////////////
// ?, !, self 기호에 대한 기능이 무엇인지 궁금함
// ! = nil이 아님. String에 ""와 null의 차이.
// displayNumber대신 기존의 displayOut을 사용하면 안되는지?

