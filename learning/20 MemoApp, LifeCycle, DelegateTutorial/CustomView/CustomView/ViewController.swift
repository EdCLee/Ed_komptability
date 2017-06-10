//
//  ViewController.swift
//  CustomView
//
//  Created by CLEE on 09/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //코드로 만들어서
        let roundBtn = RoundButton(frame: CGRect(x:10, y:10, width:100, height:100))
        //추가
//        self.view.addSubview(roundBtn)
        
        //UI도 코드로 되어있고 subview는 Array로 존재하기 때문에 맨으로 꺼내려면 insert at 0 하면 된다.
        self.view.insertSubview(roundBtn, at: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

