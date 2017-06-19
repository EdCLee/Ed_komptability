//
//  ViewController.swift
//  UIMiscellaneous
//
//  Created by CLEE on 19/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func sliderAction(_ sender: UISlider) {
        
        self.statusLabel.text = String(sender.value)
        self.backgroundView.alpha = CGFloat(sender.value)
        
    }
    
    
    @IBAction func switchAction(_ sender: UISwitch) {
        if sender.isOn {
            self.backgroundView.backgroundColor = UIColor.yellow
            self.statusLabel.text = String(sender.isOn)
        }else {
            self.backgroundView.backgroundColor = UIColor.white
            self.statusLabel.text = String(sender.isOn)
        }
    }
    
    @IBAction func actionButton(_ sender: UIButton) {
        if self.activityIndicator.isAnimating {
            self.activityIndicator.stopAnimating()
        }else {
            self.activityIndicator.startAnimating()
        }
        
        
        
    }
    
}

//NOTE

//for UI Custom Values
//
//Default - 아무것도 아닌 상태
//Highlighted - 선택이 된 상태
//Selected - 선택된 것에 true or false 값
//
//tintColor - 전체적인 톤?
//color -
//
//disable - 기능이 안되는 것. 회색처리
//able - 기능이 되며 틴트칼라 적용.
//


