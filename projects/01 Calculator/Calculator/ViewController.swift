//
//  ViewController.swift
//  Calculator
//
//  Created by CLEE on 10/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var displayOutlet: UILabel!
    
    @IBAction func touch0(_ sender: UIButton) {
        print("0")
        displayOutlet.text = displayOutlet.text! + String(sender.tag-1)
    }
    @IBAction func touch1(_ sender: UIButton) {
        print("1")
        displayOutlet.text = "1"
    }
    @IBAction func touch2(_ sender: UIButton) {
        print("2")
    }
    @IBAction func touch3(_ sender: UIButton) {
        print("3")
    }
    @IBAction func touch4(_ sender: UIButton) {
        print("4")
    }
    @IBAction func touch5(_ sender: UIButton) {
        print("5")
    }
    @IBAction func touch6(_ sender: UIButton) {
        print("6")
    }
    @IBAction func touch7(_ sender: UIButton) {
        print("7")
    }
    @IBAction func touch8(_ sender: UIButton) {
        print("8")
    }
    @IBAction func touch9(_ sender: UIButton) {
        print("9")
    }
    @IBAction func allClear(_ sender: UIButton) {
        print(" AC ")
        displayOutlet.text = ""
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

