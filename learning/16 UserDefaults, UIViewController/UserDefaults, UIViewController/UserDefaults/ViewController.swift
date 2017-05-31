//
//  ViewController.swift
//  UserDefaults
//
//  Created by CLEE on 30/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var displayer: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        nameTextField.delegate = self
//        nameTextField.placeholder = "NAME"
//        nameTextField.tag = 1
//        
//        ageTextField.delegate = self
//        ageTextField.placeholder = "AGE"
//        ageTextField.tag = 2
//        
//        let userId:String = UserDefaults.standard.object(forKey: "USER ID") as! String
//        let userAge:String = UserDefaults.standard.string(forKey: "USER AGE")!
//        
//        print(userId)
//        print(userAge)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    
    @IBAction func SubmitButton(_ sender: UIButton) {
        if !(nameTextField.text?.isEmpty)! || !(ageTextField.text?.isEmpty)! {
            UserDefaults.standard.set(nameTextField.text, forKey:"USER ID")
            UserDefaults.standard.set(ageTextField.text, forKey: "USER AGE")
            self.displayer.text = "NAME: \(nameTextField.text!), AGE: \(ageTextField.text!) 등록!"
        }else{
            self.displayer.text = "데이터 입력하세여!!"
            print("데이터를 입력하세여!")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 1:
            ageTextField.becomeFirstResponder()
            
        case 2:
            ageTextField.resignFirstResponder()
            
        default:
            textField.resignFirstResponder()
        }
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let lenghtCounter: Int = (textField.text?.characters.count)! + string.characters.count - range.length
        return lenghtCounter <= 10
    }
    
    
}

