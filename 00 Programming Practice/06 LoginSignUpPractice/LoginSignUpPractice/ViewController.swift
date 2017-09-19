//
//  ViewController.swift
//  LoginSignUpPractice
//
//  Created by CLEE on 31/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// Segue를 이용한 이동 방법 perform
//
// ***code를 이용한 이동 방법 present***
//
//  UIViewController Instance Load
//
//  1. storyboard에서 viewController마다 ID를 지정해준다.
//  2. 페이지 이동이 필요한 구간에
//      let storyboard = UIStoryboard(name:"Main", bundle: nil)
//      let vc = storyboard.instantiateViewController(withIdentifier:"StoryboardID")
//     를 선언하는데 viewController안에 파일이 존재하는 경우
//      let vc:WannaGoViewController = self.storyboard?.instantateViewController(withIdentifier:"WannaGoViewController") as! WannaGoViewController
//     라고 사용해도 된다.
//
//  3. 이동에 사용되는 명령어는
//      self.present(sign, animated: true, completion: nil)
//     이다.
