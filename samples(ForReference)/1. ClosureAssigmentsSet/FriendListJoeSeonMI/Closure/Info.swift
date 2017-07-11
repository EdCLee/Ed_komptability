//
//  Info.swift
//  FriendList
//
//  Created by joe on 2017. 6. 28..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class Info: UIViewController {
    
    
    /*******************************************/
    //            Outlet & Property            //
    /*******************************************/
    
    
    var receiveName:String?
    var receiveAge:String?
    var receiveGender:String?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    
    /*******************************************/
    //                Life Cycle               //
    /*******************************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLabel.text! = receiveName!
        self.ageLabel.text! = receiveAge!
        self.genderLabel.text! = receiveGender!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
    
    
}
