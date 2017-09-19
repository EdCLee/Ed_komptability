//
//  EdTools.swift
//  SomeProject
//
//  Created by CLEE on 11/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class EdTools {

    //MARK: 경고!
    // 일반적으로 sender는 self
    func shortAlert(title:String, message:String, buttonMsg:String, sender: UIViewController) {
        let shortAlert = UIAlertController.init(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        //let loginAlertAction = UIAlertAction.init(title:"ok",
        //style:UIAlertActionStyle.default,
        //handler: {(parameter:UIAlertAction) in print("버튼을 눌렀쪙")})
        
        //액션이 없으므로 nil 처리
        // 액션은 closer를 이용한다.
        let shortAlertAction = UIAlertAction.init(title: buttonMsg,
                                                  style:UIAlertActionStyle.cancel,
                                                  handler:nil)
        
        shortAlert.addAction(shortAlertAction)
        sender.present(shortAlert, animated:true,completion:nil)
        
    }
    
    //MARK: 이메일 양식 확인하기
    func checkEmailFormat(enteredEmail:String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
    }

    
}

