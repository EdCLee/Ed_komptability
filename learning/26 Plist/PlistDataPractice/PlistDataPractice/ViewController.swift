//
//  ViewController.swift
//  PlistDataPractice
//
//  Created by CLEE on 19/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        UserDataSet.standard.save()
        
        //userDataSet == ["list":(   ), "version: 1.0"]
        let data = UserDataSet.standard.object(forKey: "list") as! [Any]
        
        
        //data = [(person), (    ), (    )]
        for person in data {
            let personDic = person as! [String:Any]
            let name = personDic["name"] as! String
            let email = personDic["email"] as! String
            let id = personDic["id"] as! String
        }
        
//        if let selectedUser = UserDataSet0620.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

