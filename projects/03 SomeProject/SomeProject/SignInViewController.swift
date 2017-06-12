//
//  SignInViewController.swift
//  SomeProject
//
//  Created by CLEE on 11/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {

    let edTools:EdTools = EdTools()

//MARK: UI//////////////////////////////////////
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var inputIdTextField: UITextField!
    @IBOutlet weak var inputPwTextField: UITextField!
    
    
//MARK: LIFE CYCLES/////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // navigation bar 히든!
        self.navigationController?.isNavigationBarHidden = true
        
        // storyboard에서 선언 함.
        //self.inputIdTextField.delegate
        //self.inputPwTextField.delegate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
//MARK: BUTTON ACTIONS//////////////////////////
    //MARK: Logo Button Action
    @IBAction func logoButtonAction(_ sender: UIButton) {
        inputIdTextField.text = nil
        inputPwTextField.text = nil
        inputIdTextField.becomeFirstResponder()
    }
    
    //MARK: Submit Button Action
    @IBAction func submitButtonAction(_ sender: UIButton) {
        
        if (inputIdTextField.text?.isEmpty)! && (inputPwTextField.text?.isEmpty)! {
            edTools.shortAlert(title: "Plases input ID and PW", message: "", buttonMsg: "SUBMIT", sender: self)
        } else if (inputIdTextField.text?.isEmpty)! {
            edTools.shortAlert(title: "Please input ID", message: "", buttonMsg: "SUBMIT", sender: self)
        } else if (inputPwTextField.text?.isEmpty)! {
            edTools.shortAlert(title: "Please input PW", message: "", buttonMsg: "SUBMIT", sender: self)
        } else {
            
        }
    }
    
    //MARK: Forgot Password Button Action
    @IBAction func forgotPwButtonAction(_ sender: UIButton) {
        let forgotPwButtonAction:FindPwViewController = self.storyboard?.instantiateViewController(withIdentifier: "FindPwViewController") as! FindPwViewController
        
        self.present(forgotPwButtonAction, animated: true, completion: nil)
    }
    
    //MARK: Create Account Button Action
    @IBAction func createAccountButtonAction(_ sender: UIButton) {
        
        let createAccountRequest:SignUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        
        self.present(createAccountRequest, animated: true, completion: nil)
    }
    
    
//MARK: TEXTFIELD DELEGATES/////////////////////
    //MARK: Set for Return Key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.placeholder == "ID"{
            inputPwTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    //MARK: Keyboard up!
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.scrollView.setContentOffset(CGPoint(x: 0, y: 50), animated: true)
    }
    
    //MARK: Keyboard down!
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        
    }
}


//MARK: NOTE////////////////////////////////////
// AT: Create Account Button Action
//  navigation controller로 보내기 때문에 navigation bar가 나오므로
//  present modal이나 bar hidden을 시키면 bar를 가릴 수 있다.
//      self.navigationController?.isNavigationBarHidden = true
//
//      self.navigationController?.pushViewController(createAccountRequest, animated: true)
//  대신
//      self.present(createAccountRequest, animated: true, completion: nil)
//  present modal을 사용하는 경우 넘어간 페이지에서 돌아올 방법이 없으므로 버튼을 생성해 dismiss를 해줘여 한다.
//











