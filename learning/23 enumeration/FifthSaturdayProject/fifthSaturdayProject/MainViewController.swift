//
//  MainViewController.swift
//  fifthSaturdayProject
//
//  Created by 김태형 on 2017. 6. 11..
//  Copyright © 2017년 김태형. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBAction func logOutButton(_ sender: UIButton) {
        UserDefaults.standard.set(false, forKey: Need.logInOrNot)
        performSegue(withIdentifier: "unwindtologin", sender: nil)
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
