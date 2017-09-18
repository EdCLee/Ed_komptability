//
//  DetailViewController.swift
//  FriendList
//
//  Created by CLEE on 2017. 6. 26..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UINavigationBarDelegate {
    
//    var genderSegValue:Int = 0
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var segmentOutlet: UISegmentedControl!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var bracketLabel1: UILabel!
    @IBOutlet weak var bracketLabel2: UILabel!
    @IBOutlet weak var bracketLabel3: UILabel!
    @IBOutlet weak var bracketLabel4: UILabel!
    @IBOutlet weak var bracketLabel5: UILabel!
    @IBOutlet weak var bracketLabel6: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    // ... array에 담아서 for in 돌리려 했는데.. 왠지 이게 더 이쁨 :)
    @IBAction func genderSeguement(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            sender.tintColor = #colorLiteral(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315, alpha: 1)
            nameTextField.textColor = #colorLiteral(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315, alpha: 1)
            ageTextField.textColor = #colorLiteral(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315, alpha: 1)
            phoneNumberTextField.textColor = #colorLiteral(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315, alpha: 1)
            bracketLabel1.textColor = #colorLiteral(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315, alpha: 1)
            bracketLabel2.textColor = #colorLiteral(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315, alpha: 1)
            bracketLabel3.textColor = #colorLiteral(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315, alpha: 1)
            bracketLabel4.textColor = #colorLiteral(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315, alpha: 1)
            bracketLabel5.textColor = #colorLiteral(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315, alpha: 1)
            bracketLabel6.textColor = #colorLiteral(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315, alpha: 1)
//            self.genderSegValue = 0
        }else {
            sender.tintColor = #colorLiteral(red: 1, green: 0.4925479889, blue: 0.4731966853, alpha: 1)
            nameTextField.textColor = #colorLiteral(red: 1, green: 0.4925479889, blue: 0.4731966853, alpha: 1)
            ageTextField.textColor = #colorLiteral(red: 1, green: 0.4925479889, blue: 0.4731966853, alpha: 1)
            phoneNumberTextField.textColor = #colorLiteral(red: 1, green: 0.4925479889, blue: 0.4731966853, alpha: 1)
            bracketLabel1.textColor = #colorLiteral(red: 1, green: 0.4925479889, blue: 0.4731966853, alpha: 1)
            bracketLabel2.textColor = #colorLiteral(red: 1, green: 0.4925479889, blue: 0.4731966853, alpha: 1)
            bracketLabel3.textColor = #colorLiteral(red: 1, green: 0.4925479889, blue: 0.4731966853, alpha: 1)
            bracketLabel4.textColor = #colorLiteral(red: 1, green: 0.4925479889, blue: 0.4731966853, alpha: 1)
            bracketLabel5.textColor = #colorLiteral(red: 1, green: 0.4925479889, blue: 0.4731966853, alpha: 1)
            bracketLabel6.textColor = #colorLiteral(red: 1, green: 0.4925479889, blue: 0.4731966853, alpha: 1)
//            self.genderSegValue = 1
        }
    }
    
    
    
    @IBAction func saveButton(_ sender: UIButton) {
//        DataCenter.shared.add(personWithDictionary:
//            ["person_id":DataCenter.shared.dataArray.count,
//             "name":nameTextField.text!,
//             "gender":segmentOutlet.selectedSegmentIndex,
//             "age":ageTextField.text!,
//             "phone_number":phoneNumberTextField.text!])
//        
//        self.navigationController?.popViewController(animated: true)
        DataCenter.shared.add(person: Person.init(name: nameTextField.text!,
                                                  gender: Gender(rawValue: segmentOutlet.selectedSegmentIndex)!,
                                                  age: Int(ageTextField.text!)!,
                                                  phoneNumber: phoneNumberTextField.text!))
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }

    
    
//    //FIX: need to build up
//    @IBAction func deleteButton(_ sender: UIButton) {
//        
//    }
//    
//    @IBAction func resetButton(_ sender: UIButton) {
//        
//    }

    

}
