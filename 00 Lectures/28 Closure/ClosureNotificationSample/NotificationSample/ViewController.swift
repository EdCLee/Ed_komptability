//
//  ViewController.swift
//  NotificationSample
//
//  Created by CLEE on 22/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(ViewController.callNoti(sender:)),
                                               name: Notification.Name("postNoti"),
                                               object: nil)
        
        
        let v = UIView(frame:CGRect(x: 0, y: 0, width: 100, height: 100))
        
        UIView.animate(withDuration: 0.3,
                       animations: {()
                        v.frame = CGRect(x: 0, y: 0, width: 50, height: 50)},
                       completion: {(isSuccess:Bool) in })
        
        
// selector를 이렇게도 사용이 가능하나 아마 thread 문제 때문에 사용하지 않는걸 권장한다고 한다.
//        let btn:UIButton = UIButton()
//        btn.addTarget(self, action: #selector(ViewController.btnAction(_:)), for: .touchUpOutside)
    }
    
    func callNoti(sender:Notification) {
        
        viewLabel.text = sender.object as? String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
}

