//
//  ProfileViewController.swift
//  TwitterDynamicCellPractice
//
//  Created by 박종찬 on 2017. 7. 13..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var userId: String!

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.profileImageView.layer.cornerRadius = 50.0
        self.profileImageView.clipsToBounds = true


        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let id = self.userId {
            let item: Twit = DataCenter.shared.dataArray.filter({ (twit) -> Bool in
                return twit.userId == id
            }).first!
            
            self.profileImageView.image = UIImage(named: item.userPhotoUrl)
            self.backgroundImageView.image = self.profileImageView.image
            self.userIdLabel.text = item.userId
            self.userNameLabel.text = item.userName

        }
    }
    
    override func viewDidLayoutSubviews() {
        let blurEffect: UIBlurEffect = UIBlurEffect.init(style: UIBlurEffectStyle.dark)
        let blurView: UIVisualEffectView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = backgroundImageView.bounds

        self.backgroundImageView.addSubview(blurView)
        
        
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
