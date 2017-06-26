//
//  ViewController.swift
//  TimePractice
//
//  Created by CLEE on 26/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer:Timer?
    
    @IBOutlet var countLabel:UILabel?
    @IBOutlet var datePickerView:UIDatePicker?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func startTimer(forMin minutes:Int) {
        var seconds:Int = minutes
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer:Timer) in
            
            print(seconds)
            self.countLabel?.text = String(seconds)
            seconds -= 1
            
            if seconds < 0 {
                timer.invalidate()
            }
        })
        self.timer?.fire()
    }
    
    
    @IBAction func startTimerButton(_ sender:UIButton) {
        startTimer(forMin: Int((datePickerView?.countDownDuration)!))
    }
    
    
    @IBAction func datePicker(_ sender:UIDatePicker) {
        let minutes:Int = Int(sender.countDownDuration)
        self.countLabel?.text = String(minutes)
    }
    
    
    @IBAction func resetTimer(_ sender:UIButton) {
        self.timer?.invalidate()
        self.countLabel?.text = "0"
        self.datePickerView?.countDownDuration = 0
    }
    
    
    @IBAction func stopTimerButton(_ sender:UIButton){
        timer?.invalidate()
    }
    
}

