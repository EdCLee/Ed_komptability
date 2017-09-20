//
//  SignUpViewController.swift
//  SomeProject
//
//  Created by CLEE on 11/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate{

//MARK: UI/////////////////////////////////////
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var inputIdTextField: UITextField!
    @IBOutlet weak var inputEmailTextField: UITextField!
    @IBOutlet weak var inputNameTextField: UITextField!
    @IBOutlet weak var inputPwTextField: UITextField!
    @IBOutlet weak var inputPwChkTextField: UITextField!
    
    
//MARK: LIFE CYCLES////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
//MARK: BUTTON ACTIONS/////////////////////////
    
    @IBAction func logoButtonAction(_ sender: UIButton) {
        inputIdTextField.text = nil
        inputEmailTextField.text = nil
        inputNameTextField.text = nil
        inputPwTextField.text = nil
        inputPwChkTextField.text = nil
        inputIdTextField.becomeFirstResponder()
    }
    
    @IBAction func submitButtonAction(_ sender: UIButton) {
        
    }
    
    @IBAction func backButtonAction(_ sender:UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func forgotPwButtonAction(_ sender: UIButton) {
        let forgotPwButtonAction:FindPwViewController = self.storyboard?.instantiateViewController(withIdentifier: "FindPwViewController") as! FindPwViewController
        
        self.present(forgotPwButtonAction, animated: true, completion: nil)
    }
    
    
    
//MARK: TEXTFIELD DELGATES/////////////////////
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.scrollView.setContentOffset(CGPoint(x: 0, y: 60), animated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 1...4:
            self.view.viewWithTag(textField.tag + 1)?.becomeFirstResponder()
            
        default:
            textField.resignFirstResponder()
        }
        return true
    }
    
}


//MARK: NOTE///////////////////////////////////
//  AT: textFieldShouldReturn
//  self.view.viewWithTag(textField.tag + 1)?.becomeFirstResponder()
//  를 이용하면 많은 textField도 처리 가능하다.
