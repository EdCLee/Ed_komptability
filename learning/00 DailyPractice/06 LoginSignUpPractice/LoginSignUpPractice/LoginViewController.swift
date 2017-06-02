//
//  LoginViewController.swift
//  LoginSignUpPractice
//
//  Created by CLEE on 01/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    
    let customTools: EDtools = EDtools()
    var data:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if data != nil {
            idTextField.text = data
        }
        //시작과 동시에 거서 지정
        //idTextField.becomeFirstResponder()
        
        // 화면전환을 하다보면 히든을 시켜놔도 다시 나타나기도 하므로
        // 위치와 시점을 잘 고려해서 사용해야 한다.
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: 키보드 올리기
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.scrollView.setContentOffset(CGPoint(x: 0.0, y: 130.0), animated:true)
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
        
//        guard !(idTextField.text?.isEmpty)! && !(pwTextField.text?.isEmpty)! else {
//            customTools.shortAlert(title: "정보를 입력해", message: "", buttonMsg: "확인", sender: self)
//        }
//        
//        if let user = UserDefaults.standard.array(forKey: "UserList") as? [[String:Any]] {
//            
//            var loginStatus:Bool = false
//            
//            for item in user {
//                
//                
//            }
//        }
    }
    
    //MARK: 회원가입 요청
    // code를 이용한 이동시 필요 함.
    @IBAction func signUpButton(_ sender: UIButton) {
        signUpRequest()
    }
    
    func signUpRequest() {
        
        let sign:SignUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        //self.present(sign, animated: true, completion: nil)
        //navigation Controller로 연결을 코드로 작업 한것.
        self.navigationController?.pushViewController(sign, animated: true)
    }
    
}
