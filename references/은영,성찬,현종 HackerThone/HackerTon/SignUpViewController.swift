//
//  SignUpViewController.swift
//  Geuneul
//
//  Created by 서현종 on 2017. 7. 6..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit


class SignUpViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var textFieldId: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldPasswordConfirm: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldId.delegate = self
        textFieldPassword.delegate = self
        textFieldPasswordConfirm.delegate = self

    }
    var arrayTotalUser = UserDefaults.standard.array(forKey: "user") as? [[String:String]]
    
    @IBAction func overlapCheckID(_ sender:UIButton){
        var overlapID:Bool = true
        
        for i in arrayTotalUser!{
            if textFieldId.text! == i[UserInfo.id]{
                overlapID = false
            }
        }
        
        if overlapID {
            showAlert(message: "아이디 사용 가능")
        }else {
            showAlert(message: "아이디 사용 불가능")
        }
    }
    
    @IBAction func buttonSignUpAction(_ sender: UIButton)
    {
        if !((textFieldId.text?.isEmpty)! && (textFieldPassword.text?.isEmpty)! && (textFieldPasswordConfirm.text?.isEmpty)!) {
            
            if self.textFieldPassword.text != self.textFieldPasswordConfirm.text {
                
                let alertVC = UIAlertController.init(title: "경고", message: "비밀번호 재확인", preferredStyle: .alert)
                let okButton = UIAlertAction.init(title: "확인", style: .default, handler: nil)
                alertVC.addAction(okButton)
                self.present(alertVC, animated: true, completion: nil)
            }else{
                
                UserDefaults.standard.array(forKey: "user")
                
                //var arrayTotalUser:[[String:String]]?
                let dicNewUser:[String:String] = [UserInfo.id:textFieldId.text!, UserInfo.password:textFieldPassword.text!]
                
                arrayTotalUser = UserDefaults.standard.array(forKey: "user") as? [[String:String]] ?? []
                if arrayTotalUser == nil {
                    arrayTotalUser = [dicNewUser]
                }else{
                    arrayTotalUser!.append(dicNewUser)
                }
                print(arrayTotalUser!                                                                                                                                                                               )
                UserDefaults.standard.set(arrayTotalUser, forKey: "user")
                
//                var users:[String:String] = [:]
//                users.updateValue(textFieldId.text!, forKey: UserInfo.id)
//                users.updateValue(textFieldPassword.text!, forKey: UserInfo.password)
//                
//                var arrayTotal:[Any] = UserDefaults.standard.array(forKey: "user") ?? []
//                
//                arrayTotal.append(users)
//                print(arrayTotal)
//                UserDefaults.standard.set(arrayTotal, forKey: "user")
                
                
                
        
                
                self.navigationController?.popViewController(animated: true)
                
                
                
                
            }
        }
    }
    
    func showAlert(message msg:String) {
        let alertVC = UIAlertController.init(title: "경고", message: msg, preferredStyle: .alert)
        let okButton = UIAlertAction.init(title: "확인", style: .default, handler: nil)
        alertVC.addAction(okButton)
        self.present(alertVC, animated: true, completion: nil)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 10:
            textFieldPassword.becomeFirstResponder()
        case 20:
            textFieldPasswordConfirm.becomeFirstResponder()
        case 30:
            textFieldPasswordConfirm.resignFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
