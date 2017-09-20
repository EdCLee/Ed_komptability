//
//  BundleViewController.swift
//  PlistDataSample
//
//  Created by CLEE on 19/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class BundleAndDocsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func bundleWrite() {
        
        if let bundlePath = Bundle.main.path(forResource: "FriendList", ofType: "plist"),
            //contentsOf가 아닌 contentsOfFile!!
            let bundleDict = NSDictionary(contentsOfFile: bundlePath) as? [String : AnyObject] {
            print(bundleDict["list"] ?? [])
            
        }else {
            //no data
        }
    }
    
    func docsWrite() {
        let path:[String] = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let writePath = path[0] + "/FriendList.plist"
        
        if !FileManager.default.fileExists(atPath: writePath) {
            
            if let fileUrl = Bundle.main.path(forResource: "FriendList", ofType: "plist") {
                do {
                    try FileManager.default.copyItem(atPath: fileUrl, toPath: writePath)
                }catch {
                    print("non defined error")
                }
            }else {
                print("bundle data is not existing")
            }
        }
        
        if let docsDict = NSDictionary(contentsOfFile: writePath) as? [String : Any] {
            var loadData = docsDict
            loadData.updateValue("addData", forKey: "key")
            
            let nsDict:NSDictionary = NSDictionary(dictionary: loadData)
            nsDict.write(toFile: writePath, atomically: true)
        }
    }

}
