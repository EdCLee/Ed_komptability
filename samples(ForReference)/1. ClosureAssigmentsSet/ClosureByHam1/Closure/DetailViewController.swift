//
//  DetailViewController.swift
//  FriendList
//
//  Created by youngmin joo on 2017. 6. 26..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var nameOutlet: UITextField!
    @IBOutlet weak var ageOutlet: UITextField!
    @IBOutlet weak var genderOutlet: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func saveButtonTouched(_ sender: UIButton) {
        save()
    }
    

    func save() {
        var user: [String: Any] = [:]
        
        user.updateValue(nameOutlet.text!, forKey: "Name")
        user.updateValue(genderOutlet.titleForSegment(at: genderOutlet.selectedSegmentIndex)!, forKey: "Gender")
        user.updateValue(ageOutlet.text!, forKey: "Age")
        
    
        var userList: [[String: Any]] = UserDefaults.standard.array(forKey: "Users") as? [[String : Any]] ?? []
        userList.append(user)
        
        UserDefaults.standard.set(userList, forKey: "Users")
    }

}
