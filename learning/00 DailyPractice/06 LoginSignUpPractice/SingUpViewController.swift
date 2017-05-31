//
//  SingUpViewController.swift
//  LoginSignUpPractice
//
//  Created by CLEE on 31/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class SingUpViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var SignUpidTextField: UITextField!
    @IBOutlet weak var SignUpNmTextField: UITextField!
    @IBOutlet weak var SignUpPwTextField: UITextField!
    @IBOutlet weak var SignUpPcTextField: UITextField!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: 키보드 올리기
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.scrollView.setContentOffset(CGPoint(x: 0.0, y: 150.0), animated: true)
    }
    
    //MARK: 키보드 내리기
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.scrollView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: true)
    }
    
    //MARK: 취소 버튼
    @IBAction func cancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: 리턴버튼 설정
    // 태그에 1씩 추가해서 becomeFirstResponder를 먹임
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if SignUpidTextField.isFirstResponder {
            SignUpNmTextField.becomeFirstResponder()
        }else if SignUpNmTextField.isFirstResponder {
            SignUpPwTextField.becomeFirstResponder()
            
        }else if SignUpPwTextField.isFirstResponder {
            SignUpPcTextField.becomeFirstResponder()
        }else{
            textField.resignFirstResponder()
            signUpButton(<#T##sender: UIButton##UIButton#>)
        }
        return true
        // 잘 안되므로 일단 주석처리. 많을땐 이게 정답
//        switch textField.tag {
//        case 200...203:
//            self.view.viewWithTag(textField.tag + 1)?.becomeFirstResponder()
//            if textField.tag == 204 {
//                textField.resignFirstResponder()
//            }
//        default:
//            textField.resignFirstResponder()
//        }
//        return true
    }
    
    //MARK: 회원가입 버튼 액션
    @IBAction func signUpButton(_ sender: UIButton) {
        signUpRequest()
    }
    
    //MARK: 회원가입 요청
    func signUpRequest() {
        if !(SignUpidTextField.text?.isEmpty)! &&
            !(SignUpNmTextField.text?.isEmpty)! &&
            !(SignUpPwTextField.text?.isEmpty)! &&
            SignUpPwTextField.text! == SignUpPcTextField.text! {
            
            UserDefaults.standard.set(SignUpidTextField.text!, forKey: Authentification.id)
            UserDefaults.standard.set(SignUpNmTextField.text!, forKey: Authentification.name)
            UserDefaults.standard.set(SignUpPwTextField.text!, forKey: Authentification.password)
            
//            UserDefaults.standard.set(true, forKey: Authentification.authentificationBool)
//            self.performSegue(withIdentifier: "UnwindSegue", sender: self)
            
            self.dismiss(animated: true, completion: nil)
            
            
        }else{
            self.subTitleLabel.text = "똑바로 해"
        }
    }
    
    //MARK: 프리페어를 이용한 아이디자동 찍기 기능
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let newId:ViewController = segue.destination as! ViewController
        
        newId.data = SignUpidTextField.text
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
