//
//  ViewController.swift
//  Enumeration
//
//  Created by CLEE on 14/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
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


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginBtn(_ sender: UIButton) {
        showAlert(type: .LoginFail)
    }
    
    @IBAction func signupBtn(_ sender: UIButton) {
        showAlert(type: .SignupFail)
    }
    
    
    @IBAction func successAlert(_ sender: UIButton) {
        showAlert(type: .Success)
    }
    
    
    func showAlert(type:AlertType) {
        let alert = UIAlertController(title: titleMsg(for: type), message: "", preferredStyle: .alert)
        
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

}

