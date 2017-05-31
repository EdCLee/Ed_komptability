//
//  ViewController.swift
//  LoginSignUpPractice
//
//  Created by CLEE on 31/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    var data:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if data != nil {
            idTextField.text = data
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: 키보드 올리기
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.scrollView.setContentOffset(CGPoint(x: 0.0, y: 150.0), animated:true)
    }

    //MARK: 키보드 내리기
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.scrollView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: true)
    }
    
    //MARK: 리턴키 설정
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 101:
            pwTextField.becomeFirstResponder()
        case 102:
            pwTextField.resignFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
    
    //MARK: 로그인 버튼 액션
    @IBAction func loginButton(_ sender: UIButton) {
        self.loginRequest()
    }
    
    //MARK: 로그인 요청
    func loginRequest() {
        self.view.endEditing(true)
        if !(self.idTextField.text?.isEmpty)! &&
            !(self.pwTextField.text?.isEmpty)! {
            if self.idTextField.text! == UserDefaults.standard.string(forKey: "ID") &&
                self.pwTextField.text! == UserDefaults.standard.string(forKey: "Password") {
                
                UserDefaults.standard.set(true, forKey: Authentification.authentificationBool)
                self.performSegue(withIdentifier: "UnwindSegue2", sender: self)
                print("Login!")
            
            }else {
                print("Fail to login")
            }
        }
    }
    
    
}

