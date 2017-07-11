//
//  DetailViewController.swift
//  personManageProgramming
//
//  Created by 김태형 on 2017. 6. 26..
//  Copyright © 2017년 김태형. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var editingMode = false
    var cellData:[String:Any]?
    var dTempNum:Int?
    
    @IBOutlet weak var addOrFix: UIBarButtonItem!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var genderChangeOutlet: UISegmentedControl!
    
    @IBAction func addButtonTouched(_ sender: UIBarButtonItem) {
        if !(nameTextField.text?.isEmpty)! || !(ageTextField.text?.isEmpty)! {
            if editingMode == false
            {
                NewDataCenter.name = nameTextField.text!
                NewDataCenter.age = ageTextField.text!
                NewDataCenter.gender = Gender(rawValue: genderChangeOutlet.selectedSegmentIndex)!
                NewDataCenter.dataArray.append(NewDataCenter.cellData)
                self.navigationController?.popViewController(animated: true)
                
            }else
            {
                NewDataCenter.name = nameTextField.text!
                NewDataCenter.age = ageTextField.text!
                NewDataCenter.gender = Gender(rawValue: genderChangeOutlet.selectedSegmentIndex)!
                NewDataCenter.dataArray[dTempNum!] = NewDataCenter.cellData
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @IBAction func genderChangeSeg(_ sender: UISegmentedControl) {
        sender.titleForSegment(at: sender.selectedSegmentIndex)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameTextField.text = cellData?["name"] as? String ?? ""
        ageTextField.text = cellData?["age"] as? String ?? ""
        genderChangeOutlet.selectedSegmentIndex = (cellData?["gender"] as? Gender.RawValue) ?? 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
