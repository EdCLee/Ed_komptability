//
//  ViewController.swift
//  HelloKittyPixelArt
//
//  Created by CLEE on 22/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //Hello Kitty///////////////////
        // set one pixel size as 20 x 20
        let helloKitty = UIView(frame:CGRect(x: 30, y: 300, width: 375, height: 375))
        helloKitty.backgroundColor = UIColor.white
        self.view.addSubview(helloKitty)
        
        let pointA9 = UILabel(frame:CGRect(x: 160, y: 0, width: 40, height: 20))
        pointA9.backgroundColor = UIColor.black
        helloKitty.addSubview(pointA9)
        
        let pointA12 = UILabel(frame:CGRect(x: 220, y: 0, width: 60, height: 20))
        pointA12.backgroundColor = UIColor.black
        helloKitty.addSubview(pointA12)
        
        let pointB3 = UILabel(frame:CGRect(x: 40, y: 20, width: 60, height: 20))
        pointB3.backgroundColor = UIColor.black
        helloKitty.addSubview(pointB3)
        
        let pointB8 = UILabel(frame:CGRect(x: 140, y: 20, width: 20, height: 20))
        pointB8.backgroundColor = UIColor.black
        helloKitty.addSubview(pointB8)
        
        let pointB9 = UILabel(frame:CGRect(x: 160, y: 20, width: 40, height: 20))
        pointB9.backgroundColor = UIColor.red
        helloKitty.addSubview(pointB9)
        
        let pointB11 = UILabel(frame:CGRect(x: 200, y: 20, width: 20, height: 20))
        pointB11.backgroundColor = UIColor.black
        helloKitty.addSubview(pointB11)
        
        let pointB15 = UILabel(frame:CGRect(x: 280, y: 20, width: 20, height: 20))
        pointB15.backgroundColor = UIColor.black
        helloKitty.addSubview(pointB15)
        
        let pointC2 = UILabel(frame:CGRect(x: 20, y: 40, width: 20, height: 80))
        pointC2.backgroundColor = UIColor.black
        helloKitty.addSubview(pointC2)
        
        let pointC6 = UILabel(frame:CGRect(x: 100, y: 40, width: 40, height: 20))
        pointC6.backgroundColor = UIColor.black
        helloKitty.addSubview(pointC6)
        
        let pointC8 = UILabel(frame:CGRect(x: 140, y: 40, width: 60, height: 20))
        pointC8.backgroundColor = UIColor.red
        helloKitty.addSubview(pointC8)
        
        let pointC11 = UILabel(frame:CGRect(x: 200, y: 40, width: 40, height: 20))
        pointC11.backgroundColor = UIColor.black
        helloKitty.addSubview(pointC11)
        
        let pointC14 = UILabel(frame:CGRect(x: 260, y: 40, width: 40, height: 20))
        pointC14.backgroundColor = UIColor.black
        helloKitty.addSubview(pointC14)
        
        let pointD7 = UILabel(frame:CGRect(x: 120, y: 60, width: 20, height: 40))
        pointD7.backgroundColor = UIColor.black
        helloKitty.addSubview(pointD7)
        
        let pointD8 = UILabel(frame:CGRect(x: 140, y: 60, width: 20, height: 40))
        pointD8.backgroundColor = UIColor.red
        helloKitty.addSubview(pointD8)
        
        let pointD9 = UILabel(frame:CGRect(x: 160, y: 60, width: 40, height: 20))
        pointD9.backgroundColor = UIColor.black
        helloKitty.addSubview(pointD9)
        
        let pointD11 = UILabel(frame:CGRect(x: 200, y: 60, width: 40, height: 40))
        pointD11.backgroundColor = UIColor.red
        helloKitty.addSubview(pointD11)
        
        let pointD13 = UILabel(frame:CGRect(x: 240, y: 60, width: 20, height: 40))
        pointD13.backgroundColor = UIColor.black
        helloKitty.addSubview(pointD13)
        
        let pointD14 = UILabel(frame:CGRect(x: 260, y: 60, width: 40, height: 20))
        pointD14.backgroundColor = UIColor.red
        helloKitty.addSubview(pointD14)
        
        let pointD16 = UILabel(frame:CGRect(x: 300, y: 60, width: 20, height: 180))
        pointD16.backgroundColor = UIColor.black
        helloKitty.addSubview(pointD16)
        
        let pointE9 = UILabel(frame:CGRect(x: 160, y: 80, width: 20, height: 20))
        pointE9.backgroundColor = UIColor.red
        helloKitty.addSubview(pointE9)
        
        let pointE10 = UILabel(frame:CGRect(x: 180, y: 80, width: 20, height: 20))
        pointE10.backgroundColor = UIColor.black
        helloKitty.addSubview(pointE10)
        
        let pointE14 = UILabel(frame:CGRect(x: 260, y: 80, width: 20, height: 40))
        pointE14.backgroundColor = UIColor.black
        helloKitty.addSubview(pointE14)
        
        let pointE15 = UILabel(frame:CGRect(x: 280, y: 80, width: 20, height: 40))
        pointE15.backgroundColor = UIColor.red
        helloKitty.addSubview(pointE15)
        
        let pointF8 = UILabel(frame:CGRect(x: 140, y: 100, width: 40, height: 20))
        pointF8.backgroundColor = UIColor.black
        helloKitty.addSubview(pointF8)
        
        let pointF11 = UILabel(frame:CGRect(x: 200, y: 100, width: 40, height: 20))
        pointF11.backgroundColor = UIColor.black
        helloKitty.addSubview(pointF11)
        
        let pointF13 = UILabel(frame:CGRect(x: 240, y: 100, width: 20, height: 40))
        pointF13.backgroundColor = UIColor.red
        helloKitty.addSubview(pointF13)
        
        let pointG1 = UILabel(frame:CGRect(x: 0, y: 120, width: 20, height: 120))
        pointG1.backgroundColor = UIColor.black
        helloKitty.addSubview(pointG1)
        
        let pointG12 = UILabel(frame:CGRect(x: 220, y: 120, width: 20, height: 20))
        pointG12.backgroundColor = UIColor.black
        helloKitty.addSubview(pointG12)
        
        let pointG14 = UILabel(frame:CGRect(x: 260, y: 120, width: 20, height: 20))
        pointG14.backgroundColor = UIColor.red
        helloKitty.addSubview(pointG14)
        
        let pointG15 = UILabel(frame:CGRect(x: 280, y: 120, width: 20, height: 20))
        pointG15.backgroundColor = UIColor.black
        helloKitty.addSubview(pointG15)
        
        let pointH13 = UILabel(frame:CGRect(x: 240, y: 140, width: 40, height: 20))
        pointH13.backgroundColor = UIColor.black
        helloKitty.addSubview(pointH13)
        
        let pointI2 = UILabel(frame:CGRect(x: 20, y: 160, width: 20, height: 20))
        pointI2.backgroundColor = UIColor.black
        helloKitty.addSubview(pointI2)
        
        let pointI15 = UILabel(frame:CGRect(x: 280, y: 160, width: 20, height: 20))
        pointI15.backgroundColor = UIColor.black
        helloKitty.addSubview(pointI15)
        
        let pointJ5 = UILabel(frame:CGRect(x: 80, y: 180, width: 20, height: 40))
        pointJ5.backgroundColor = UIColor.black
        helloKitty.addSubview(pointJ5)
        
        let pointJ12 = UILabel(frame:CGRect(x: 220, y: 180, width: 20, height: 40))
        pointJ12.backgroundColor = UIColor.black
        helloKitty.addSubview(pointJ12)
        
        let pointK2 = UILabel(frame:CGRect(x: 20, y: 200, width: 20, height: 20))
        pointK2.backgroundColor = UIColor.black
        helloKitty.addSubview(pointK2)
        
        let pointK15 = UILabel(frame:CGRect(x: 280, y: 200, width: 20, height: 20))
        pointK15.backgroundColor = UIColor.black
        helloKitty.addSubview(pointK15)
        
        let pointL8 = UILabel(frame:CGRect(x: 140, y: 220, width: 40, height: 20))
        pointL8.backgroundColor = UIColor.black
        helloKitty.addSubview(pointL8)
        
        let pointM2 = UILabel(frame:CGRect(x: 20, y: 240, width: 20, height: 40))
        pointM2.backgroundColor = UIColor.black
        helloKitty.addSubview(pointM2)
        
        let pointM15 = UILabel(frame:CGRect(x: 280, y: 240, width: 20, height: 40))
        pointM15.backgroundColor = UIColor.black
        helloKitty.addSubview(pointM15)
        
        let pointO3 = UILabel(frame:CGRect(x: 40, y: 280, width: 40, height: 20))
        pointO3.backgroundColor = UIColor.black
        helloKitty.addSubview(pointO3)
        
        let point13 = UILabel(frame:CGRect(x: 240, y: 280, width: 40, height: 20))
        point13.backgroundColor = UIColor.black
        helloKitty.addSubview(point13)
        
        let pointP5 = UILabel(frame:CGRect(x: 80, y: 300, width: 160, height: 20))
        pointP5.backgroundColor = UIColor.black
        helloKitty.addSubview(pointP5)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

