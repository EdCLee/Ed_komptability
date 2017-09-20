//
//  MainTabbarViewController.swift
//  InstagramSample
//
//  Created by youngmin joo on 2017. 7. 25..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit
import Firebase
class MainTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //autoLogin
        //>진행
        //>로그인 화면 프레젠트
        if !DataCenter.sharedData.requestIsLogin()
        {
            DispatchQueue.main.async {
                self.showLoginVC()
            }
            
        }
        
        //탭바 setting
        
        let vc1 = UIViewController()
        vc1.view.backgroundColor = .red
        vc1.tabBarItem.image = #imageLiteral(resourceName: "home_unselected")
        vc1.tabBarItem.selectedImage = #imageLiteral(resourceName: "home_selected")
        
        let vc2 = UIViewController()
        vc2.view.backgroundColor = .green
        vc2.tabBarItem.image = #imageLiteral(resourceName: "search_unselected")
        vc2.tabBarItem.selectedImage = #imageLiteral(resourceName: "search_selected")
        
        let vc3 = UIViewController()
        vc3.view.backgroundColor = .blue
        vc3.tabBarItem.image = #imageLiteral(resourceName: "plus_unselected")
        
        
        let vc4 = UIViewController()
        vc4.view.backgroundColor = .blue
        vc4.tabBarItem.image = #imageLiteral(resourceName: "like_unselected")
        vc4.tabBarItem.selectedImage = #imageLiteral(resourceName: "like_selected")
        
        let layout = UICollectionViewFlowLayout()
        let vc5 = ProfileViewController(collectionViewLayout: layout)
        vc5.view.backgroundColor = .blue

        let vc5Navi = UINavigationController(rootViewController: vc5)
        vc5Navi.tabBarItem.image = #imageLiteral(resourceName: "profile_unselected")
        vc5Navi.tabBarItem.selectedImage = #imageLiteral(resourceName: "profile_selected")
        
        viewControllers = [vc1, vc2, vc3, vc4, vc5Navi]
        
    }

    
   
    
    func showLoginVC()
    {
        let loginVC = LoginViewController()
        let navi = UINavigationController(rootViewController: loginVC)
        self.present(navi, animated: false, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    //tabbarController Delegate


}
