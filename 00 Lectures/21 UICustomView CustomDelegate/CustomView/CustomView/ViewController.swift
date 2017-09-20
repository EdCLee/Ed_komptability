//
//  ViewController.swift
//  CustomView
//
//  Created by CLEE on 12/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CircleViewDelegate, UITextFieldDelegate {

//    @IBOutlet var item:ItemButton!
    var tf:UITextField?
    
    @IBOutlet var circle1:CircleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        circle1.setTitleText(":)")
//        circle2.setTitleText("XX")
//        
//        circle1.title?.text = "dddd"
//        
//        //btn
//        let btn:UIButton = UIButton()
//        
//        btn.setTitle("Ed", for:.normal)
//        btn.titleLabel?.text = "lpp"
        
//        //circleBtn
//        circleBtn1.buttonLabel?.text = "ITEM No.1"
        
        circle1.setTitleText("IKUZO")
        circle1.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func isAbleToTouch() -> Bool {
        return true
    }
    
    func didSelectedItem(item: CircleView) {
        print(item.title?.text)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

