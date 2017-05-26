//
//  ViewController.swift
//  protocolDelegate
//
//  Created by CLEE on 26/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

//textField Delegate를 사용하라면
//UITextFieldDelegate 메소드를 호출 해야 함.
class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tf1: UITextField!
    @IBOutlet weak var tf2: UITextField!
    @IBOutlet weak var tf3: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tf1.delegate = self
        tf1.placeholder = "tf1"
        tf1.tag = 1
        
        tf2.delegate = self
        tf2.placeholder = "tf2"
        tf2.tag = 2
        
        tf3.delegate = self
        tf3.placeholder = "tf3"
        tf3.tag = 3

        print(_NSRange.init(location: 5, length: 5))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 1:
            tf2.becomeFirstResponder()
        case 2:
            tf3.becomeFirstResponder()
        case 3:
            tf3.resignFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        print("return button!!")
        return true
    }
    
    //MARK: length와 location을 이용한 글자수 카운트 메소드
    // Bug report: location으로 잡기 때문에 글을 쓴 후 뒤로 이동한 뒤 작성하면 추가 작성이 가능 함.
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//    
//        print("location: \(range.location)")
//        print("length: \(range.length)")
//        print("string: " + string)
//        
//        // 조건에 range.length == 0 를 추가해서 버그를 잡는다.
//        if range.location <= 9 && range.length == 0 {
//            return true
//        }else{
//            return false
//        }
//    }
    
    //MARK: characters.count를 이용한 글자수 카운트 메소드
    // Bug report: 글을 최대 길이까지 작성 한 후 back space가 안됨.
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        
//        print("location: \(range.location)")
//        print("length: \(range.length)")
//        print("string: " + string)
//        
//        // 조건에 10 && string != "" 를 추가해서 버그를 잡는다.
//        if (textField.text?.characters.count)! < 10 && string != ""{
//            return true
//        }else {
//            return false
//        }
//    }
    
    //MARK: 정답같은 글자수 카운트 메소드
    // textfield의 조건에 따라 format을 입력하려면 switch를 태운다.
    // NSString, NSRange에 대해 알아야 함.
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        
//        var textCount = textField.text! as NSString
//        textCount = textCount.replacingCharacters(in: range, with: string) as NSString
//        
//        return textCount.length <= 10
//    }

}
