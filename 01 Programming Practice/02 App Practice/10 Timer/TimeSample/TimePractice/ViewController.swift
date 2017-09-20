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
    
    @IBOutlet var textLable:UILabel?
    @IBOutlet var textInput:UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func startTimer(forMin minute:Int) {
        
        let seconds:Int = minute * 60
        var index:Int = 0
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1,
                                          repeats: true,
                                          block: { (timer:Timer) in
            
            print(index)
            self.textLable?.text = String(index)
            index += 1
            if index > seconds {
                timer.invalidate()
            }
            
        })
        
        self.timer?.fire()
        
    }
    
    
    
    @IBAction func startCount(_ sender:UIButton) {
        startTimer(forMin: Int((textInput?.text)!)!)
    }

    
}

