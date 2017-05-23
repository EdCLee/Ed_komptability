//
//  ViewController.swift
//  BaseBallGame
//
//  Created by CLEE on 23/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

// 같은 수가 없는 경우 Out
// 같은 수, 배열 위치가 다른 경우 Ball
// 같은 수, 배열 위치가 같은 경우 Strike
class ViewController: UIViewController {

//variables/////////////////////////////////////////////////
    //MARK: 선택한 숫자 표시
    @IBOutlet weak var firstNumDisplay: UILabel!
    @IBOutlet weak var secondNumDisplay: UILabel!
    @IBOutlet weak var thirdNumDisplay: UILabel!

    //MARK: 상태 표시
    @IBOutlet weak var systemDisplay: UILabel!
    
    //MARK: 도전 횟수 Display name tag
    @IBOutlet weak var attempsLabel: UILabel!
    //MARK: 도전 횟수 Display
    @IBOutlet weak var attempsDisplay: UILabel!
    //MARK: 경고 Display name tag
    @IBOutlet weak var warningLabel: UILabel!
    //MARK: 경고 Display
    @IBOutlet weak var warningDisplay: UILabel!
    
    //MARK: 입력 값
    var selectedNum:[Int] = []
    
    //MARK: 정답 값
    var answerNum:[Int] = []
    
    //MARK: 도전 횟수
    var attempsCount:Int = 0
    
    
    
    
    
//viewDidLoad///////////////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
    
        resultRandomNum()
        print(answerNum)
    }

    
    
    
    
    
    
//functions/////////////////////////////////////////////////
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: 랜덤 답안 번호 도출
    func resultRandomNum() {
        while self.answerNum.count < 3 {
            let randomNum:UInt32 = arc4random_uniform(9) + 1
            if !(self.answerNum.contains(Int(randomNum))) {
                self.answerNum.append(Int(randomNum))
            }
        }
    }
    
    //MARK: 번호 1~9
    @IBAction func numericButton(_ sender: UIButton) {
        if self.firstNumDisplay.text == "" {
            self.firstNumDisplay.text = sender.currentTitle
            selectedNum.insert(Int(sender.currentTitle!)!, at: 0)
            
        }else if secondNumDisplay.text == "" {
            self.secondNumDisplay.text = sender.currentTitle
            selectedNum.insert(Int(sender.currentTitle!)!, at: 1)
            
        }else if thirdNumDisplay.text == "" {
            self.thirdNumDisplay.text = sender.currentTitle
            selectedNum.insert(Int(sender.currentTitle!)!, at: 2)
            
        }else{
            self.systemDisplay.text = "\"Ready!\""
        }
    }

    //MARK: 게임 시작 버튼
    @IBAction func goPlayButton(_ sender: UIButton) {
        var strikeCount = 0
        var ballCount = 0
        var outCount = 0

        if selectedNum.count == 3 {
            warningLabel.text = ""
            warningDisplay.text = ""
            for index in 0...2 {
                if answerNum[index] == selectedNum[index] {
                    strikeCount += 1
                    
                }else if answerNum.contains(selectedNum[index]) {
                    ballCount += 1
                    
                }else{
                    outCount += 1
                }
            }
            self.attempsCount += 1
            attempsLabel.text = "Attemps Count"
            attempsDisplay.text = "\(attempsCount)"
            self.systemDisplay.text = "Strike: \(strikeCount) Ball: \(ballCount) Out: \(outCount)"
            self.selectedNum = []
            self.firstNumDisplay.text = ""
            self.secondNumDisplay.text = ""
            self.thirdNumDisplay.text = ""
        }else{
            warningLabel.text = "Warning!"
            warningDisplay.text = "\"Ready!\""
        }
    }
    
    @IBAction func retryGame(_ sender: UIButton) {
        answerNum = []
        resultRandomNum()
        print(answerNum)
        
        selectedNum = []
        attempsCount = 0
        self.firstNumDisplay.text = ""
        self.secondNumDisplay.text = ""
        self.thirdNumDisplay.text = ""
        self.systemDisplay.text = "\"Ready!\""
        self.attempsLabel.text = ""
        self.attempsDisplay.text = ""
    }
}

