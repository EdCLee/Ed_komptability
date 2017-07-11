//
//  DetailViewController.swift
//  FriendList
//
//  Created by youngmin joo on 2017. 6. 26..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {

    var insertedGender : Gender = Gender.Man
    var personDelegate : PersonDataDelegate?
    
    @IBOutlet weak var nameTF: UITextField!
    @IBAction func sexSegmented(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            insertedGender = Gender.Woman
        }
    }
    @IBOutlet weak var ageTF: UITextField!

    @IBAction func saveBtn(_ sender: UIBarButtonItem) {
        
        if nameTF.text?.isEmpty==true && ageTF.text?.isEmpty==true {
            
            let emptyAlert = UIAlertController.init(title: "Please don't make blank.", message: nil, preferredStyle: .alert)
            let emptyAlertButton = UIAlertAction.init(title: "OK", style: .default, handler: nil)
            emptyAlert.addAction(emptyAlertButton)
            self.present(emptyAlert, animated: true, completion: nil)
            
        } else {
            
            personDelegate?.insertPersonData(self, personInfo: Person.init(name: nameTF.text!, gender: insertedGender, age: Int(ageTF.text!)!))
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 1:
            nameTF.resignFirstResponder()
        case 2:
            ageTF.resignFirstResponder()
        default:
            ageTF.resignFirstResponder()
        }
        return true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}

protocol PersonDataDelegate {
    func insertPersonData(_ detailVC:DetailViewController, personInfo:Person)
}
