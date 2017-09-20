//
//  ViewController.swift
//  PlistDataSample
//
//  Created by CLEE on 19/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        FriendData.standard.set("Ed" as AnyObject, forKey: "ff")
        FriendData.standard.object(forKey: "dd")
        
        //bundle
//        let bundle = Bundle.main
//        let path = bundle.path(forResource: "FriendList", ofType: "plist")
        
        
//        if let realPath = path {
//            
//            // Any 안됨!
//            let dict = NSDictionary(contentsOfFile: realPath) as? [String:AnyObject]
//            
//            // optional binding
//            if let realDic = dict {
//                
//            }
//            
//        } else {
//            // no files야
//        }

        
        // 위에꺼 너무 길어서 이렇게!
        if let realPath = Bundle.main.path(forResource: "FriendList", ofType: "plist"),
            let dict = NSDictionary(contentsOfFile: realPath) as? [String:AnyObject] {
            
            print(dict["list"])
            
            } else {
                // no files야
            }
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //documents
    func writeFile() {
        //1. 파일 불러오기(NSSearchPathForDirectoriesInDomains)
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let realPath = path[0] + "/FriendsList.plist"
        
        // fileManager 인스턴스를 생성해서 사용
        let fileManager = FileManager.default
        
        //2. Document folder에 파일이 있는지 확인
        if !fileManager.fileExists(atPath: realPath) {

            //3. bundle에 있는 파일 Document에 복사
            if let bundlePath = Bundle.main.path(forResource: "FriendList", ofType: "plist") {
            
                do {
                    try fileManager.copyItem(atPath: bundlePath, toPath: realPath)
                } catch {
                    //에러처리
                    return
                }
            }else {
                //에러처리
                return
            }
        }
        
        //4. Dictionary 인스턴스 불러오기
        let dict = NSDictionary(contentsOfFile: realPath) as? [String:AnyObject]
        
        //
        
        //5. write(toFile) 메소드를 통해 파일 저장
        let nsDict = NSDictionary(dictionary: dict!)
        nsDict.write(toFile: realPath, atomically: true)
    }

}

