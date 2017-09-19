//
//  DetailViewController.swift
//  FriendList
//
//  Created by youngmin joo on 2017. 6. 26..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

protocol FriendDataSource {
    func friendAddInfo(person: Person)
    func friendEditInfo(person: Person, index: Int)
}


class DetailViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderSegmnet: UISegmentedControl!
    
    
    @IBOutlet weak var addBarBtnOutlet: UIButton!
    
    @IBOutlet weak var editBtnOutlet: UIButton!
    
    var friendDelegate: FriendDataSource?
    var genderEnumCase: Gender = .Man
    // 선택된 정보를 받은 변수
    var personInfoDetail: Person?
    var personIndex: Int?
    
    var test = "test"
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        if personInfoDetail != nil{
            print("detail viewdidoad")
            self.loadInfo()
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func genderValueChange(_ sender: UISegmentedControl) {
        let segmentIndex = sender.selectedSegmentIndex
        print(segmentIndex)
        switch segmentIndex {
        case 0:
            self.genderEnumCase = .Man
        case 1:
            self.genderEnumCase = .Woman
        default:
            self.genderEnumCase = .Man
        }
        
    }
    @IBAction func addFriendBtnToched(_ sender: UIButton) {
        let friendName: String = nameTextField.text ?? ""
        //let gender = genderTextField.text ?? ""
        //        var genderEnum: Gender?
        let friendAge: Int = Int(ageTextField.text!) ?? 0
        print("*************\(self.genderEnumCase)")
        //        switch gender {
        //        case "남자":
        //            genderEnum = Gender.Man
        //        case "여자":
        //            genderEnum = Gender.Woman
        //        default:
        //            genderEnum = Gender.Man
        //        }
        
        
        
        let friendData = Person(name: friendName, gender: self.genderEnumCase, age: friendAge)
        // Delegate Pattern을 이용
        friendDelegate?.friendAddInfo(person: friendData)
        
        /**
         // Notification post를 통해 전달
         NotificationCenter.default.post(name: Notification.Name(rawValue: "addFriedNoti"), object: friendData)
         **/
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func friendEditBtnTouched(_ sender: UIButton){
        print("수정버튼")
        let friendName: String = nameTextField.text ?? ""
        //let gender = genderTextField.text ?? ""
        //        var genderEnum: Gender?
        let friendAge: Int = Int(ageTextField.text!) ?? 0
        print("*************\(self.genderEnumCase)")
        //        switch gender {
        //        case "남자":
        //            genderEnum = Gender.Man
        //        case "여자":
        //            genderEnum = Gender.Woman
        //        default:
        //            genderEnum = Gender.Man
        //        }
        
        
        
        let friendData = Person(name: friendName, gender: self.genderEnumCase, age: friendAge)
        // Delegate Pattern을 이용
        friendDelegate?.friendEditInfo(person: friendData, index: self.personIndex!)
    
        print("----------수정버튼끝")
        self.navigationController?.popViewController(animated: true)
    
    }
    
    func loadInfo(){
        self.editBtnOutlet.isHidden = false
        self.addBarBtnOutlet.isHidden = true
        
        guard let person = personInfoDetail else {
            return
        }
        if let personInfo = personInfoDetail {
            
        }else{
            
        }
        self.nameTextField.text = person.name
        //gender 처리
        var segIndex = 0
        if person.gender == .Woman {
            segIndex = 1
        }
        print("######### 선택한 인덱스 값#######")
        print(self.personIndex!)
        print("######### ----------- #######")

        self.genderSegmnet.selectedSegmentIndex = segIndex
        
        self.ageTextField.text = String(describing: person.age)
        
    }
    

}
