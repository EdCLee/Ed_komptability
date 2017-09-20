//
//  MainViewController.swift
//  LoginSignUpPractice
//
//  Created by CLEE on 31/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let isAuthentified: Bool = UserDefaults.standard.bool(forKey: Authentification.authentificationBool)
        
        if !isAuthentified {
            print(isAuthentified)
            
            // code를 이용한 이동시 필요한 변수
            //let vc:LoginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            
            // code를 이용한 이동
            //self.present(vc, animated: true, completion: nil)
            
            
            // Navigation Controller를 이용한 변수
            let navi:UINavigationController = self.storyboard?.instantiateViewController(withIdentifier: "NavigationID") as! UINavigationController
            
            // navi를 이용한 이동
            self.navigationController?.present(navi, animated: true, completion: nil)
            
            
            // Segue를 이용한 이동
            //self.performSegue(withIdentifier: "loginSegueID", sender: self)
        }
    }
    
    @IBAction func unwindToMain(_ segue:UIStoryboardSegue){
        
    }

    @IBAction func logoutButton(_ sender: UIButton) {
        
        // logout 버튼을 누르면 URL을 false로 처리해서
        // performSegue를 태워서 로그아웃 처리한다.
//        UserDefaults.standard.set(false, forKey: Authentification.authentificationBool)
//        self.performSegue(withIdentifier: "loginSegueID", sender: self)
    }

}
