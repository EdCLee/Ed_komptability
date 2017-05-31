//
//  MainViewController.swift
//  LoginSignUpPractice
//
//  Created by CLEE on 31/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let isAuthentified: Bool = UserDefaults.standard.bool(forKey: Authentification.authentificationBool)
        
        if !isAuthentified {
            print(isAuthentified)
            self.performSegue(withIdentifier: "loginSegueID", sender: self)
        }
    }
    
    @IBAction func unwindToMain(_ segue:UIStoryboardSegue){
        
    }

    @IBAction func logoutButton(_ sender: UIButton) {
        
        // logout 버튼을 누르면 URL을 false로 처리해서
        // performSegue를 태워서 로그아웃 처리한다.
        UserDefaults.standard.set(false, forKey: Authentification.authentificationBool)
        self.performSegue(withIdentifier: "loginSegueID", sender: self)
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
