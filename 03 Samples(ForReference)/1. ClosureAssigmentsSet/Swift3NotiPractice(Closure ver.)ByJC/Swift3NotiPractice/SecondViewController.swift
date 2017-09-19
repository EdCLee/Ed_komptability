//
//  SecondViewController.swift
//  Swift3NotiPractice
//
//  Created by 박종찬 on 2017. 6. 29..
//  Copyright © 2017년 박종찬. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var valueTextField: UITextField!
    
    var person: Person? {
        didSet {
            NotificationCenter.default.post(name: dataChangedNotification, object: person)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonTouched(_ sender: UIButton) {
        
        
        //포스팅. userInfo사용시 '[AnyHashable:Any]?' 딕셔너리로 보내야 받을 수 있음!
        NotificationCenter.default.post(name: dataChangedNotification, object: nil, userInfo: ["person" : Person.init(name: valueTextField.text!)])
        self.person = Person.init(name: valueTextField.text!)
        
    }

}

struct Person {
    let name: String
}
