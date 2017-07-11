//
//  DetailViewController.swift
//  FriendList
//
//  Created by youngmin joo on 2017. 6. 26..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderSegment: UISegmentedControl!
    @IBOutlet weak var saveButton: UIButton!
    
    var name: String = ""
    var age: String = ""
    var gender: String = ""
    var indexRow: Int = 0
    var originalPositions: [Int] = []
    var editingMode: Bool = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.text = name
        ageTextField.text = age
        setGenderSegment(text: gender)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveButtonTouched(_ sender: UIButton) {
        
        if editingMode {
            edit()
            self.navigationController?.popViewController(animated: true)
        } else {
            save()
            self.navigationController?.popViewController(animated: true)
        }
  
    }
    
    func save() {
        DataFile.instance.saveData(name: nameTextField.text!, gender: genderSegment.titleForSegment(at: genderSegment.selectedSegmentIndex)!, age: ageTextField.text!)
    }
    
    func edit() {
        DataFile.instance.editData(name: nameTextField.text!, gender: genderSegment.titleForSegment(at: genderSegment.selectedSegmentIndex)!, age: ageTextField.text!, index: originalPositions[indexRow])
    }
    
    
    func setGenderSegment(text: String) {
        
        if gender == Gender.Man.rawValue {
            genderSegment.selectedSegmentIndex = 0
        }
        
        if gender == Gender.Woman.rawValue {
            genderSegment.selectedSegmentIndex = 1
        }
    }
}
