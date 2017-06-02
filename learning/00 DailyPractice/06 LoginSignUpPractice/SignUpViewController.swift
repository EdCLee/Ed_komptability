//
//  SingUpViewController.swift
//  LoginSignUpPractice
//
//  Created by CLEE on 31/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var SignUpidTextField: UITextField!
    @IBOutlet weak var SignUpNmTextField: UITextField!
    @IBOutlet weak var SignUpPwTextField: UITextField!
    @IBOutlet weak var SignUpPcTextField: UITextField!
    @IBOutlet weak var SignUpEmTextField: UITextField!
    
    let customTools: EDtools = EDtools()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 화면전환을 하다보면 히든을 시켜놔도 다시 나타나기도 하므로 
        // 위치와 시점을 잘 고려해서 사용해야 한다.
        self.navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    //MARK: 키보드 올리기
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.scrollView.setContentOffset(CGPoint(x: 0.0, y: 130.0), animated: true)
    }
    
    //MARK: 키보드 내리기
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.scrollView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: true)
    }
    
    //MARK: 취소 버튼
    @IBAction func cancelButton(_ sender: UIButton) {
        //self.dismiss(animated: true, completion: nil)
        //self.navigationController?.popViewController(animated: true)
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    //MARK: 리턴버튼 설정
    // 태그에 1씩 추가해서 becomeFirstResponder를 먹임
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if SignUpidTextField.isFirstResponder {
            SignUpEmTextField.becomeFirstResponder()
        }else if SignUpEmTextField.isFirstResponder {
            SignUpNmTextField.becomeFirstResponder()
            
        }else if SignUpNmTextField.isFirstResponder {
            SignUpPwTextField.becomeFirstResponder()
            
        }else if SignUpPwTextField.isFirstResponder {
            SignUpPcTextField.becomeFirstResponder()
            
        }else if SignUpPcTextField.isFirstResponder {
            SignUpPcTextField.resignFirstResponder()
            
        }else {
            textField.resignFirstResponder()
            signUpRequest()
        }
        return true
    }
    
    
    //MARK: 회원가입 버튼 액션
    @IBAction func signUpButton(_ sender: UIButton) {
        signUpRequest()
    }
    
    //MARK: 회원가입 요청
    func signUpRequest() {
        // 회원가입시 빈칸 체크
        if !(SignUpidTextField.text?.isEmpty)! &&
            !(SignUpNmTextField.text?.isEmpty)! &&
            !(SignUpPwTextField.text?.isEmpty)! &&
            !(SignUpPcTextField.text?.isEmpty)! {

            // 회원가입시 이메일 양식 확인
            if customTools.checkEmailFormat(enteredEmail: SignUpEmTextField.text!) == true {
                
                // 회원가입시 비밀번화 확인
                if SignUpPwTextField.text! == SignUpPcTextField.text! {
                    var user:[String:Any] = [:]
                    
                    user.updateValue(SignUpidTextField.text!, forKey: Authentification.id)
                    user.updateValue(SignUpEmTextField.text!, forKey: Authentification.email)
                    user.updateValue(SignUpNmTextField.text!, forKey: Authentification.name)
                    user.updateValue(SignUpPwTextField.text!, forKey: Authentification.password)
                    
                    //UserList가 기본적으로 빈값이기때문에 애러가 난다.
                    // ?? nil coalescing - 기본값이 없으면 [] 넣으라는 것.
                    
                    var userList:[Any] = UserDefaults.standard.array(forKey: "UserList") ?? []
                    userList.append(user)
                    
                    UserDefaults.standard.set(userList, forKey: "UserList")
                    
                    // 회원가입 완료 후 로그인 페이지로 이동.
                    self.navigationController?.dismiss(animated: true, completion: nil)
                    
                }else {
                    customTools.shortAlert(title: "비밀번호가 틀렸습니다.", message: "", buttonMsg: "확인", sender: self)
                }
            }else {
                customTools.shortAlert(title: "이메일 양식에 맞게 쓰세여", message: "", buttonMsg: "확인", sender: self)
            }
        }else {
            customTools.shortAlert(title: "정보를 입력하세여", message: "", buttonMsg: "확인", sender: self)
        }
    }
    
    
    //MARK: 프리페어를 이용한 아이디자동 찍기 기능
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let prepareId:LoginViewController = segue.destination as! LoginViewController
        prepareId.data = SignUpidTextField.text
    }

}
