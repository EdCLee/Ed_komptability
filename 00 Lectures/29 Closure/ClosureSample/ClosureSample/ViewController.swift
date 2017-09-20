//
//  ViewController.swift
//  ClosureSample
//
//  Created by CLEE on 23/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(self.pickRandomLottoNumber())
        
        let alert:UIAlertController =
            UIAlertController.init(title:"test",
                                   message:nil,
                                   preferredStyle:UIAlertControllerStyle.alert)
        
        let okAction:UIAlertAction =
            UIAlertAction.init(title:"OK",
                               style:UIAlertActionStyle.default,
                               handler:{(sender:UIAlertAction) in print("OK Button")})
        
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: {print("alert is working now")})
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    
    func pickRandomLottoNumber() -> [Int] {
        
        var numberSet: Set<Int> = []
        
        while numberSet.count < 6 {
            numberSet.insert(Int(arc4random_uniform(UInt32(45)))+1)
        }
        
        let resultArray = numberSet.sorted(by:
        {(num1:Int, num2:Int) -> Bool in return num1 < num2})
        
        return resultArray
    }

}

