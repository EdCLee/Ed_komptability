//
//  ViewController.swift
//  HackerThoneDraft
//
//  Created by Dong Yoon Han on 7/6/17.
//  Copyright © 2017 DY. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    var timer = Timer()
    
//    let colors:[UIColor] = [.red, .orange, .clear, .green, .blue, .darkGray, .purple]
    let colors = [
        UIColor(red: 233/255, green: 203/255, blue: 198/255, alpha: 1),
        UIColor(red: 38/255, green: 188/255, blue: 192/255, alpha: 1),
        UIColor(red: 253/255, green: 221/255, blue: 164/255, alpha: 1),
        UIColor(red: 235/255, green: 154/255, blue: 171/255, alpha: 1),
        UIColor(red: 87/255, green: 141/255, blue: 155/255, alpha: 1)
    ]

    var colorIndex = 0
    var boolTables:[Bool] = []
    var counter:Int = 0
    @IBOutlet weak var gameView: GameView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.boolTables = Array(repeating: true, count: self.gameView.numberOfCols * self.gameView.numberOfRows)
    }

    @IBAction func buttonTouched(_ sender: UIButton) {
        startChange()
    }

    func startChange()
    {
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.0001, repeats: true) { [unowned self] (timer1) in

            let randomIndex:Int = Int(arc4random_uniform(UInt32(self.gameView.numberOfCols * self.gameView.numberOfCols)))
            if self.boolTables[randomIndex] == true
            {
                self.gameView.viewArray[randomIndex].backgroundColor = self.colors[self.colorIndex]
                self.counter += 1
                self.boolTables[randomIndex] = false
            }
            if self.counter == self.gameView.numberOfCols * self.gameView.numberOfRows
            {
                self.colorIndex += 1
                print(self.colorIndex)
                self.counter = 0
                self.boolTables = Array(repeating: true, count: self.gameView.numberOfCols * self.gameView.numberOfRows)
            }
            if self.colorIndex >= self.colors.count
            {
                self.timer.invalidate()
                self.colorIndex = 0
            }
        }
        self.timer.fire()
    }

    func changeColor(color:UIColor)
    {
        let randomIndex:Int = Int(arc4random_uniform(UInt32(gameView.numberOfCols * gameView.numberOfCols)))
        if boolTables[randomIndex] == true
        {
            self.gameView.viewArray[randomIndex].backgroundColor = color
            counter += 1
            boolTables[randomIndex] = false
        }
    }
    
    @IBAction func stopButtonTouched(_ sender: UIButton) {
        self.timer.invalidate()
    }
}

