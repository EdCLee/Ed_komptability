//
//  ViewController.swift
//  DrawFrenchFlag
//
//  Created by CLEE on 22/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        let frenchFlag = UIView(frame: CGRect(x: 0, y: 30, width: 375, height: 250))
        frenchFlag.backgroundColor = UIColor.white
        self.view.addSubview(frenchFlag)
        
        let subView1:UIView = UIView(frame:CGRect(x: 30, y: 0, width: 105, height: 250))
        subView1.backgroundColor = UIColor.blue
        frenchFlag.addSubview(subView1)
        
        let subView2:UIView = UIView(frame:CGRect(x: 135, y: 0, width: 105, height: 250))
        subView2.backgroundColor = UIColor.white
        frenchFlag.addSubview(subView2)
        
        let subView3:UIView = UIView(frame:CGRect(x: 240, y: 0, width: 105, height: 250))
        subView3.backgroundColor = UIColor.red
        frenchFlag.addSubview(subView3)
        
        
        let label1 = UILabel(frame:CGRect(x: 0, y: 0, width: 105, height: 250))
        label1.text = "F R"
        label1.textColor = UIColor.white
        label1.textAlignment = NSTextAlignment.center
        label1.font = UIFont.systemFont(ofSize: 70)
        subView1.addSubview(label1)
        
        let label2 = UILabel(frame:CGRect(x: 0, y: 0, width: 105, height: 250))
        label2.text = "A N"
        label2.textColor = UIColor.black
        label2.textAlignment = NSTextAlignment.center
        label2.font = UIFont.systemFont(ofSize: 66)
        subView2.addSubview(label2)
        
        let label3 = UILabel(frame:CGRect(x: 0, y: 0, width: 105, height: 250))
        label3.text = "C E"
        label3.textColor = UIColor.white
        label3.textAlignment = NSTextAlignment.center
        label3.font = UIFont.systemFont(ofSize: 70)
        subView3.addSubview(label3)
        
        //        let bounds = UIScreen.main.bounds
        //        let height = bounds.size.height - 115
        //        let secondView:UIView = UIView(frame: CGRect(x: 15, y: height, width: 345, height: 100))
        //        secondView.backgroundColor = UIColor.blue
        //        self.view.addSubview(secondView)
        //
        //        let label1 = UILabel(frame:CGRect(x: 30, y: 30, width: 100, height: 50))
        //        label1.text = "FRANCE"
        //        label1.textColor = UIColor.white
        //        label1.textAlignment = NSTextAlignment.center
        //        label1.font = UIFont.systemFont(ofSize: 20)
        //        self.view.addSubview(label1)
        
        //        let newImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        //        newImage.image =
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

