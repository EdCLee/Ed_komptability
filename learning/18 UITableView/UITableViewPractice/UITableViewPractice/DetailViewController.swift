//
//  DetailViewController.swift
//  UITableViewPractice
//
//  Created by CLEE on 02/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var selectedPoketMon: UIImageView!
    @IBOutlet weak var expressionOfSelection: UILabel!
    
    var imageName:String?
    var titleName:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let imageName = self.imageName ?? "DefaultImageName"
        let titleName = self.titleName ?? "?"
        
        selectedPoketMon.image = UIImage(named: imageName)
        expressionOfSelection.text = titleName
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
