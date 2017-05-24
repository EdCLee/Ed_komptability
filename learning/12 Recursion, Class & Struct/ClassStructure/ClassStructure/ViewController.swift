//
//  ViewController.swift
//  ClassStructure
//
//  Created by CLEE on 24/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var b1:Book = Book(name:"책이름1", cost:1000, isbn:1)
        var b2 = b1
        b2.name = "톰소여의 모험"
        
        print(b1.name)
        print(b2.name)
        
        ////////////////////////////////
        let bs1:BookStore = BookStore(name:"신사점", address:"신사동 어딘가")
        let bs2 = bs1
        bs2.name = "영등포점"
        
        print(bs1.name)
        print(bs2.name)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

