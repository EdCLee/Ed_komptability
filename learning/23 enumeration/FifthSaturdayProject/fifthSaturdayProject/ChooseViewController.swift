//
//  ChooseViewController.swift
//  fifthSaturdayProject
//
//  Created by 김태형 on 2017. 6. 11..
//  Copyright © 2017년 김태형. All rights reserved.
//

import UIKit

class ChooseViewController: UIViewController {

    @IBAction func choosePocketButtonTouched(_ sender: UIButton) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let random = segue.destination as! RandomPocketViewController
        let randomInt = arc4random_uniform(150) + 1
        
        random.pocketInt = randomInt
        
        
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
