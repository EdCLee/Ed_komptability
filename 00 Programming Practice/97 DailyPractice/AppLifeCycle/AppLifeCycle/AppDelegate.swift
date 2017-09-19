//
//  AppDelegate.swift
//  AppLifeCycle
//
//  Created by CLEE on 12/08/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//




import UIKit

@UIApplicationMain
// 아래의 메서드들은 UIApplicationDelegate에 정의되어 있다.
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // AppLifeCycle에서 UI콜(스토리보드)가 불린 다음에 First Initiallization 에서 실행 되는 부분.
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {

        print("application(willFinishLaunchingWithOptions)")
        
        //앱 실행후 무조건 한번 초기화가 진행되어야 하는 경우.
        
        //스토리보드가 생기기 이전에 작업 예제.
        // 뷰 컨트롤을 만드는 작업
        // window?.rootViewController = ViewController()
        // xib 파일 작업
        
        //코어데이터 사용할 경우
        
        return true
    }

    //앱이 실행되서 화면에 뿌리기 전에 실행되는 Final Initialization. First와 Final 사이에는 Restore UI state가 있음.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        print("application(didFinishLaunchingWithOptions)")
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        
        print("applicationWillResignActive")
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        // 백그라운드로 들어갈때 리소스를 저장한다던지 유저 정보를 저장할때 여기서 실행 시켜준다.
        print("applicationDidEnterBackground")
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        
        print("applicationWillEnterForeground")
    }

    // 앱이 활성화 되었을때 실행되는 코드.
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        print("applicationDidBecomeActive")
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
        print("applicationWillTerminate")
        
    }


}

//note

// didFinishLaunchingWithOptions은 앱이 실행될때 한번만 실행이 된다.
// applicationDidBecomeActive는 앱이 실행될때 한번만 실행이 되지만 앱이 백그라운드에서 액티브로 전환이 될때마다 실행이 되기때문에 경우에 맞게 선택해서 사용한다.
