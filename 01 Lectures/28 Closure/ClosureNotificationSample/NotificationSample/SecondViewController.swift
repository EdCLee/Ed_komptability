//
//  SecondViewController.swift
//  NotificationSample
//
//  Created by CLEE on 22/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

//typealias MyType = NSNotification.Name

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    @IBAction func changedValue(_ sender:UISwitch) {
        if sender.isOn {
            NotificationCenter.default.post(name: Notification.Name("postNoti"), object:"Change!")
        } else {
            NotificationCenter.default.post(name: Notification.Name("postNoti"), object:"Reset!")
        }
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    

}
