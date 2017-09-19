//
//  DetailViewController.swift
//  FriendList
//
//  Created by youngmin joo on 2017. 6. 26..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    
    /*******************************************/
    //            Outlet & Property            //
    /*******************************************/
    
    @IBOutlet weak var picker: UIPickerView!
    
    var pickerviewArray = 1...100
    var gender:Gender = Gender.Man
    
    @IBOutlet weak var segmentedOutlet: UISegmentedControl!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    
    @IBAction func genderSegmented(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            return gender = Gender.Man
        case 1:
            return gender = Gender.Woman
        default:
            return gender = Gender.Man
        }
    }
    
    @IBAction func clickedDoneBtn(_ sender: UIButton) {
        if !(nameTF.text?.isEmpty)! && !(ageTF.text?.isEmpty)! {
            checkSaveAlert()
            
        }else{
            callAlert()
        }
        
    }
    
    
    
    /*******************************************/
    //                Life Cycle               //
    /*******************************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.isHidden = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    /*******************************************/
    //                  func                   //
    /*******************************************/
    
    //빈칸있을때 Alert
    func callAlert() {
        
        let alert:UIAlertController = UIAlertController.init(title: "오류!!!!!", message: "빈칸!!!!!!!!", preferredStyle: .alert)
        let okBtn:UIAlertAction = UIAlertAction.init(title: "채운다", style: .default, handler: nil)
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    //세이브할꺼냐고 묻는다
    func checkSaveAlert() {
        
        let alert:UIAlertController = UIAlertController.init(title: "추가할까여?", message: "이름: \(nameTF.text!)\n나이: \(ageTF.text!)\n 성별: \(gender)", preferredStyle: .alert)
        let okBtn:UIAlertAction = UIAlertAction.init(title: "확인", style: .default) { (alert:UIAlertAction) in
            self.friendSave()
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    //세이브함수를 만들어볼까용
    func friendSave(){
        
        let person:Person = Person.init(name: nameTF.text!, gender: gender, age: Int(ageTF.text!)!)
        
        DataFile.sharedData.friendList.append(person)
        print(DataFile.sharedData.friendList)
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField.tag == 1 {
            picker.isHidden = false
            view.endEditing(true)
            return false
        }
        return true
    }
    
 
    
    //픽커뷰 만들어볼까용
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerviewArray.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let mapPickerView = pickerviewArray.map { (num:Int) -> String in
            return "\(num)"
        }
        return mapPickerView[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let mapPickerView = pickerviewArray.map { (num:Int) -> String in
            return "\(num)"
        }
        return ageTF.text! = mapPickerView[row]
    }
    
    
}
