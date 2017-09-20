//
//  ViewController.swift
//  Animation
//
//  Created by CLEE on 29/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var colors:[UIColor] = [#colorLiteral(red: 0.0204696469, green: 0.6631956697, blue: 0.8840020299, alpha: 1), #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1), #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)]
    
    
    @IBOutlet weak var sampleView: UIView!
    
    @IBOutlet weak var sampleVIew2:UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        sampleView.backgroundColor = colors[0]
        sampleView.frame.origin.x = self.view.frame.origin.x - 100
        self.sampleVIew2.frame.origin.y = self.view.center.y
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loopingTest() {
        
    }
    
    @IBAction func actionButton(_ sender: UIButton) {
//        let originLocation = self.sampleView.frame.origin.x

        for color in colors {
            
            UIView.animate(withDuration: 0, animations: {
                self.sampleView.backgroundColor = color
//                self.sampleView.frame.origin.x = self.view.center.x
                
                
                self.sampleVIew2.backgroundColor = self.sampleView.backgroundColor
            }, completion: nil )
            
            
        }
        
//        for color in colors
//        {
//        UIView.animate(withDuration: 0.3,
//                       delay: 0.5,
//                       options: [.curveEaseIn,.autoreverse],
//                       animations: {var newFrame = self.sampleView.frame
//                                    newFrame.origin.x = self.view.center.x
//                                    self.sampleView.frame = newFrame
//        })
//        
////        UIView.animate(withDuration: 1,
////                       delay: 0,
////                       dampingRatio: 0.4,
////                       velocity: 0.9,
////                       options: [.curveLinear],
////                       animations: { self.sampleView.layer.transform = CATransform3DMakeScale(3, 3, 1)
////        }) { (isEnd) in
////            self.imgView.layer.transform = CATransform
////        }
//            
//        UIView.animate(withDuration: 1, animations: {
//            //CATransform3DMakeRotation(R값, x, y, z) <-- x,y,z는 회전 축
//            self.sampleView.layer.transform = CATransform3DMakeRotation(360*180/3.14, 0, 0, 1)
//            self.sampleView.backgroundColor = color
//
////            self.sampleView.alpha = 0.5
//        }
//        ) {(isEnd) in
//            UIView.animate(withDuration: 0.3, animations: {
//                self.sampleView.layer.transform = CATransform3DMakeScale(1, 1, 1)
////                self.sampleView.alpha = 1
//            }
//                , completion: { (Void) in
//                self.sampleVIew2.backgroundColor = self.sampleView.backgroundColor
////                self.sampleVIew2.backgroundColor = color
//                self.sampleView.backgroundColor = UIColor.clear
//            } )
//         
//            }
//        
//        }
    
    }
    
}

