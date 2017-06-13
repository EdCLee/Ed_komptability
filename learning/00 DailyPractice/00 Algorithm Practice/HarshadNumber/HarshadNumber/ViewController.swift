//
//  ViewController.swift
//  HarshadNumber
//
//  Created by CLEE on 13/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    
    var variableNumber:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func operatingBtn(_ sender: UIButton) {
        harshardCheck()
    }
    
    func harshardCheck() {
        var number:Int?
        var numberArray:[Int] = []
        var slicedNumber:Int = 0
        var fixedNumber:Int = 0
        
        number = Int(textField.text!)!
        fixedNumber = Int(textField.text!)!
        
        
        while number! % 10 > 0 {
            numberArray.insert(number! % 10, at: 0)
            number = number! / 10
            
            print("number--1-->\(number!)")
            print("numberArray--2-->\(numberArray)")
        
        }
        
        
        for index in 0...numberArray.count-1 {
            slicedNumber += numberArray[index]
            
            print("slicedNumber--3-->\(slicedNumber)")
        }

        
        if (fixedNumber % slicedNumber) == 0 {
            textLabel.text = "HARSHAD NUMBER"
        }else {
            textLabel.text = "NON HARSHAD NUMBER"
        }
        
    }

}

