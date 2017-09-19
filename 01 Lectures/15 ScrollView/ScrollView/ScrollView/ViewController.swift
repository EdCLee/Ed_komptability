//
//  ViewController.swift
//  ScrollView
//
//  Created by CLEE on 29/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        //MARK: Scroll View 만들기
//        let scrollView:UIScrollView = UIScrollView(frame:self.view.bounds)
//        // Scroll View의 사이즈
//        scrollView.contentSize = CGSize(width: self.view.bounds.width * 5, height: self.view.bounds.height)
//        scrollView.isPagingEnabled = true
//        
//        // bounds 밖이 보이는지 안보이는지.
//        scrollView.bounces = true
//        // bounces 가 true일때 사용가능한 새로고침 기능.
//        scrollView.refreshControl = UIRefreshControl.init()
//        scrollView.refreshControl?.tintColor = .red
//        
//        // alwaysBounce는 튕기는 액션
////        scrollView.alwaysBounceVertical = true
////        scrollView.alwaysBounceHorizontal = true
//
//        // inset은 공통 margin을 줄때 사용하기도 한다.
////        scrollView.contentInset
//        
//        
////        scrollView.setContentOffset(CGRect(x: 300, y: 0), animated: true)
//        
//        // scrollView를 올린다!
//        self.view.addSubview(scrollView)
//        
//        
//        // UIColor는 타입추론으로 삭제가 가능하다.
//        let view1:UIView = UIView(frame: CGRect(x: self.view.bounds.size.width * 0 , y: 0, width: scrollView.bounds.size.width , height: scrollView.bounds.size.height))
//        view1.backgroundColor = UIColor.yellow
//        scrollView.addSubview(view1)
//        
//        let view2:UIView = UIView(frame: CGRect(x: self.view.bounds.size.width * 1, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height))
//        view2.backgroundColor = UIColor.red
//        scrollView.addSubview(view2)
//        
//        let view3:UIView = UIView(frame:CGRect(x: self.view.bounds.size.width * 2, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height))
//        view3.backgroundColor = .blue
//        // alpha값도 적용 가능
//        view3.alpha = 0.3
//        scrollView.addSubview(view3)
//        
//        let view4:UIImageView = UIImageView(frame: CGRect(x: self.view.bounds.size.width * 3, y: 0, width: scrollView.bounds.size.width, height: scrollView.bounds.size.height))
//        view4.image = #imageLiteral(resourceName: "bg1.png")
//        // 이미지 스케일 맞추기.
//        view4.contentMode = .scaleAspectFit
//        scrollView.addSubview(view4)
//        
////        let view5:UIWebView = UIWebView(frame: CGRect(x: self.view.bounds.size.width * 4, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height))
////        view5.loadRequest(request:  www.google.com)
////        scrollView.addSubview(view5)
////        
//        
//    }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

