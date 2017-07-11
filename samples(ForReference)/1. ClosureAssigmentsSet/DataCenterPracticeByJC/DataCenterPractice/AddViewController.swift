//
//  AddViewController.swift
//  DataCenterPractice
//
//  Created by 박종찬 on 2017. 6. 30..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UINavigationBarDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBAction func saveButtonTouched(_ sender: UIBarButtonItem) {
        //지금까지 있는 사람 수를 새로운 아이디로 넘긴다.
        DataCenter.shared.add(person: Person.init(name: nameTextField.text!, gender: Gender(rawValue: genderSegmentedControl.selectedSegmentIndex)!, age: Int(ageTextField.text!)!, phoneNumber: phoneNumberTextField.text!))
        self.dismiss(animated: true, completion: nil)
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }

    @IBAction func cancelButtonTouched(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
