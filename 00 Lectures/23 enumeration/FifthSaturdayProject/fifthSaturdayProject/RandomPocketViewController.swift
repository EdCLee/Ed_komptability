//
//  RandomPocketViewController.swift
//  fifthSaturdayProject
//
//  Created by 김태형 on 2017. 6. 11..
//  Copyright © 2017년 김태형. All rights reserved.
//

import UIKit

class RandomPocketViewController: UIViewController {

    var pocketInt:UInt32?
    
    @IBOutlet weak var pocketMonTextLabel: UILabel!
    @IBOutlet weak var pocketMonView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        pocketMonView.image = UIImage(named: "\(Int(pocketInt!)).png")
        pocketMonTextLabel.text = PoketMonData.names[Int(pocketInt! - 1)]
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
