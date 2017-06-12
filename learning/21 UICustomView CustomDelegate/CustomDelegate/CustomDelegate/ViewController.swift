//
//  ViewController.swift
//  CustomDelegate
//
//  Created by CLEE on 12/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CustomDelegate, UITextFieldDelegate {
    
    @IBOutlet var customView:CustomView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func didSelectedItem(item: CustomView) {
        print(customView?.txtLabel?.text ?? "")
    }
    
    func isAbleToTouch() -> Bool {
        return true
    }


}

