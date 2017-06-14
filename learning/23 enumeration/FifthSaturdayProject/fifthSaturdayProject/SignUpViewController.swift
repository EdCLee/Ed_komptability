//
//  SignUpViewController.swift
//  fifthSaturdayProject
//
//  Created by 김태형 on 2017. 6. 11..
//  Copyright © 2017년 김태형. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var passWordCheckTextField: UITextField!
    
    
    
    @IBAction func signUpButton(_ sender:UIButton) {
        signUpRequest()
        
        
        
    }
    func signUpRequest(){
        var userList = UserDefaults.standard.array(forKey: Need.userInfo) as? [[String:String]] ?? []
        var userIdArray:Array<String> = []
        
        for userInfo in userList
        {
            
            
            let userId = userInfo[Need.userId] ?? ""
            userIdArray.append(userId)
            
        }
        
        if (idTextField.text?.isEmpty)! || (passWordTextField.text?.isEmpty)! || (passWordCheckTextField.text?.isEmpty)!{
            let alertCollect = UIAlertController(title: "모든 칸에 기입해주세요", message: "플리즈", preferredStyle: .alert)
            
            let alertAct = UIAlertAction(title: "넹", style: .default, handler: nil)
            alertCollect.addAction(alertAct)
            
            present(alertCollect, animated: true, completion: nil)
        }else if passWordCheckTextField.text! != passWordTextField.text
        {
            let alertCollect = UIAlertController(title: "동일한 비밀 번호를 입력해주세요", message: "플리즈", preferredStyle: .alert)
            
            let alertAct = UIAlertAction(title: "넹", style: .default, handler: nil)
            alertCollect.addAction(alertAct)
            present(alertCollect, animated: true, completion: nil)
        }else if !(userIdArray.contains(idTextField.text!))
        {
            userList.append([Need.userId:idTextField.text! , Need.userPassWord:passWordTextField.text!])
            UserDefaults.standard.set(userList, forKey: Need.userInfo)
            UserDefaults.standard.set(true, forKey: Need.logInOrNot)
            Need.currentUserId = idTextField.text!
            Need.currentUserPassWord = passWordTextField.text!
            performSegue(withIdentifier: "signuptomain", sender: nil)
            
            
        }else{
            let alertCollect = UIAlertController(title: "이미 가입된 회원 정보 입니다", message: "딴거 써주세용", preferredStyle: .alert)
            
            let alertAct = UIAlertAction(title: "넹", style: .default, handler: nil)
            alertCollect.addAction(alertAct)
            present(alertCollect, animated: true, completion: nil)
            
        }
        
            
        
    
    
//            let alertCollect = UIAlertController(title: "이미 가입된 회원 정보 입니다", message: "다시 입력해주세요", preferredStyle: .alert)
//            let alertAct = UIAlertAction(title: "넹", style: .default, handler: nil)
//            alertCollect.addAction(alertAct)
//            present(alertCollect, animated: true, completion: nil)
        
//        }else if userIdArray.contains(idTextField.text!){
//            let alertCollect = UIAlertController(title: "이미 가입된 회원 정보입니다", message: "다시 입력해주세요", preferredStyle: .alert)
//            
//            let alertAct = UIAlertAction(title: "넹", style: .default, handler: nil)
//            alertCollect.addAction(alertAct)
//        }else if !(userIdArray.contains(idTextField.text!)) && passWordTextField.text! == passWordCheckTextField.text!{
//            userList.append([Need.userId:idTextField.text! , Need.userPassWord:passWordTextField.text!])
//            UserDefaults.standard.set(userList, forKey: Need.userInfo)
//            UserDefaults.standard.set(true, forKey: Need.logInOrNot)
//            performSegue(withIdentifier: "signuptomain", sender: nil)
//            
//        }
        
        
//        {
//            for userInfo in userList
//            {
//                let userId = userInfo[Need.userId]
//                
//                if passWordTextField.text! == passWordCheckTextField.text! && idTextField.text! != userId!
//                {
//                
//                
//                   
//                    userList.append([Need.userId:idTextField.text! , Need.userPassWord:passWordTextField.text!])
//                    UserDefaults.standard.set(userList, forKey: Need.userInfo)
//                    
//                    
//                    
//                    UserDefaults.standard.set(true, forKey: Need.logInOrNot)
////                    print(UserDefaults.standard.string(forKey: Need.userId))
////                    print(UserDefaults.standard.string(forKey: Need.userPassWord))
//                    performSegue(withIdentifier: "signuptomain", sender: nil)
//                    return
//                }
//            
//            }
//            return
        
//        }
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            passWordTextField.becomeFirstResponder()
        }else if textField.tag == 1{
            passWordCheckTextField.becomeFirstResponder()
        }else{
            textField.resignFirstResponder()
        }
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
