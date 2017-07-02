//
//  ViewController.swift
//  UIGestureRecognize
//
//  Created by CLEE on 29/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var axisValue: UILabel!
    
    var colorSet = [#colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1),#colorLiteral(red: 0.8321695924, green: 0.985483706, blue: 0.4733308554, alpha: 1),#colorLiteral(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315, alpha: 1),#colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1),#colorLiteral(red: 1, green: 0.5409764051, blue: 0.8473142982, alpha: 1),#colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1)]
    
    var tapCount:Int = 0
    var tapLocation:CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        
        
        if tapLocation == sender.location(in: self.view) {
            tapCount += sender.numberOfTouches
//            let vcolor = colorSet[tapCount]
//            countLabel.textColor = vcolor
        }else{
            tapCount = 1
        }
        tapLocation = sender.location(in: self.view)
        
        countLabel.text = String(tapCount)
        axisValue.text = String(describing: tapLocation!)
        
    }

}
