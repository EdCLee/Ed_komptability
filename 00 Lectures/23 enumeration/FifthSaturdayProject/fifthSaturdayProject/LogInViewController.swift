//
//  LogInViewController.swift
//  fifthSaturdayProject
//
//  Created by 김태형 on 2017. 6. 11..
//  Copyright © 2017년 김태형. All rights reserved.
//

import UIKit

enum keyEnum:String {
    
    case logInKey = "loginKey"
    case signUpKey = "signUpKey"
}

enum IDEnum:String {
    
    case loginID = "logintosignup"
}

enum AlertType {
    case LoginFail
    case Success
    case SignupFail
}

class LogInViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBAction func logInButtonTouched(_ sender: UIButton) {
        logInRequest()
    }
    @IBAction func signUpButtonTouched(_ sender: UIButton) {
        // enum에서 작성한 키 값을 입력 함.
        performSegue(withIdentifier: IDEnum.loginID.rawValue, sender: nil)
    }
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loginOr = UserDefaults.standard.bool(forKey: Need.logInOrNot)
        if loginOr == true{
            performSegue(withIdentifier: "logintomain", sender: nil)
        }

        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0{
            passWordTextField.becomeFirstResponder()
        }else{
            textField.resignFirstResponder()
        }
        
        return true
    }
    func logInRequest(){
        
        let userInfo = UserDefaults.standard.array(forKey: Need.userInfo) as? [[String:String]] ?? []
        

        
        
        if (idTextField.text?.isEmpty)! || (passWordTextField.text?.isEmpty)!{
            let alertCollect = UIAlertController(title: "전부 기입해주세요", message: "플리즈", preferredStyle: .alert)
            let alertAct = UIAlertAction(title: "넹", style: .default, handler: nil)
            alertCollect.addAction(alertAct)
            present(alertCollect, animated: true, completion: nil)
        }else {
            for userList in userInfo{
                if [Need.userId:idTextField.text! , Need.userPassWord:passWordTextField.text!] == userList
                {
                    
                    UserDefaults.standard.set(true, forKey: Need.logInOrNot)
                    Need.currentUserId = idTextField.text!
                    Need.currentUserPassWord = passWordTextField.text!
                    performSegue(withIdentifier: "logintomain", sender: nil)
                    return
                }
//                }else if idTextField.text == userId && passWordTextField.text != userPassWord
//                {
//                
//                
//                    
//                    let alertCollect = UIAlertController(title: "비밀 번호가 틀렸습니다", message: "힝", preferredStyle: .alert)
//                    let alertAct = UIAlertAction(title: "잘 생각해봐용", style: .default, handler: nil)
//                    alertCollect.addAction(alertAct)
//                    present(alertCollect, animated: true, completion: nil)
//                }else if idTextField.text != userId && passWordTextField.text != userPassWord
//                {
//                    let alertCollect = UIAlertController(title: "그런 회원 정보 없지롱", message: "힝", preferredStyle: .alert)
//                    let alertAct = UIAlertAction(title: "잘 생각해봐용", style: .default, handler: nil)
//                    alertCollect.addAction(alertAct)
//                    present(alertCollect, animated: true, completion: nil)
//                }
//                
            }
            let alertCollect = UIAlertController(title: "회원 정보가 일치 하지 않습니다", message: "다시 확인해주세요", preferredStyle: .alert)
            let alertAct = UIAlertAction(title: "넹", style: .default, handler: nil)
            alertCollect.addAction(alertAct)
            present(alertCollect, animated: true, completion: nil)

        }
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x: 0, y: -10), animated: true)
    }
    
    @IBAction func unwindToLogIn(_ sender:UIStoryboardSegue){
        
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAlert(type:AlertType) {
        let alert = UIAlertController(title: titleMsg(for: type), message: titleMsg(for: type), preferredStyle: .alert)
        
        let action = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(action)
        
        self.present(alert, animated:true, completion:nil)
    }
    
    func titleMsg(for type:AlertType) -> String {
        var title = ""
        switch type {
        case .LoginFail:
            title = "로그인 실패"
        case .SignupFail:
            title = "회원가입 실패"
        case .Success:
            title = "성공"
        }
        return title
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
