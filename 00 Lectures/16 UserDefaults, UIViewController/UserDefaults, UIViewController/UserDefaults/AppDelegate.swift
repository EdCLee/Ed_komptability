//
//  AppDelegate.swift
//  UserDefaults
//
//  Created by CLEE on 30/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //뷰컨트롤러를 코드로 불러와서 띄운다.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        
        //이건 알아야 함.
        // 정확하게 인과관계를 파악해놓아야 한다.
        
        //ViewController 연결
//        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController: ViewController = storyboard.instantiateViewController(withIdentifier: "viewController") as! ViewController
        
        //mainViewController 연결
        //name: "Main"은 Main.storyboard를 얘기한다. name을 변경하면 다른 스토리 보드와 연결 가능.
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController: MainViewController = storyboard.instantiateViewController(withIdentifier: "mainViewController") as! MainViewController
        
        self.window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

