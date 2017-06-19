# Plist Data
> Property list는 key와 value로 되어있으며 value가 key의 collection이면 indent가 한칸 들어간다.

<br>

## plist
- 심플한 "파일" 저장 방법 중 하나
- key, value구조로 데이터 저장
- file 형태로 저장되다보니 외부에서 Access가능(보안취약)
	- device에 cable 연결 후 itunes를 통해 App을 unarchieve하면 데이터 파일을 뽑아 낼 수 있다.

#### 파일 위치	
- 파일이 저장되는 곳 Bundle & Documents 폴더
- Bundle은 프로젝트에 추가된 모든 Resource가 모인 곳
- 프로그램이 실행되며 저장하는 파일은 Documents 폴더에 저장된다.

- Plist 파일의 데이터만 불러오는 역할은 Bundle에서,
- Plist 파일에 데이터를 쓰고 불러오는 역할은 Documents 폴더에 저장된 파일로 한다.
	- plist를 생성하는 방법: 
		- xml 파일에 코드로 작성하는 방법 -> Documents에 저장
		- xCode에서 plist 파일 생성 후 작성 -> Bundle에 저장

<br>
<br>
<br>

## Bundle
> 실행코드, 이미지, 사운드, nib파일, 프레임 워크, 설정파일 등 코드와 리소스가 모여있는 file system내의 Directory

<br>

#### Main Bundle 가져오기

```swift
	//Get the main bundle for the app.
	let mainBundle = Bundle.main
	
	// Bundle 인스턴스를 활용해 Singleton Pattern으로 사용한다.
```

#### Bundle 파일 주소 가져오기

```swift
	//Get the main bundle for the app.
	let mainBundle = Bundle.main
	let filePath = mainBundle.path(forResource: "rName", ofType: "rType")
	
	//Path for Resource
	// mp3파일을 가져온다면 forResource: "음원이름", ofType: ".mp3"
```

#### 데이터 불러오기

```swift
	if let path = filePath {
		let image = UIImage(contentOfFile: path!)
	}
	
	// 파일을 사용하려면 instance로 변환을 해줘야한다.
```

###### Plist File in Bundle

```swift
//1. Bundle에 있는 파일 path 가져오기
//2. Path를 통해 객체로 변환, 데이터 불러오기
//3. 사용!

	if let filePath = Bundle.main.path(forResource: "rName", of Type: "rType"),
		let dict = NSDictionary(contentsOfFile: filePath) as? [String:AnyObject] {
		
		// use swift dictionary as normal	
	}
	
```

- Bundle에서 filePath를 가져올때 Array, Dictionary로 바로 가져올 수 없어서 Property Serialize를 이용 -> NSDictionary(class 타입)을 통해 Array, Dictionary로 가져올 수 있다.

-  참고로 Dictionary는 struct.
	
- **SWIFT4 에서는 NSDictionary를 통하지 않고 바로 가져올 수 있다고 한다.**

<br>
<br>
<br>

## Document

#### 1. 파일 불러오기(NSSearchPathForDirectoriesInDomains)

```swift
	let path:[String] = NSSearchPathForDirectoriesInDomains(.documentDirectory, .useDomainMask, true)
	let basePath = path[0] + "/fileName.plist"
	
	// document 폴더에 Path 구하기
```

#### 2. Document folder에 파일이 있는지 확인

```swift
	if !FileManager.default.fileExists(atPath: basePath) {
		//code
	}
	
	// document 폴더에 plist 파일이 존재하는지 확인
```

#### 3. bundle에 있는 파일 Document에 복사

```swift
	if let fileUrl = Bundle.main.path(forResource: "fileName", ofType: "plist") {
		do {
			try FileManager.default.copyItem(atPath: fileUrl, toPath: basePath)
		} catch {
			print("fail")
		}
	}
	
	// 만약 document에 해당 plist 파일이 존재하지 않을때, bundle에 있는 파일을 document폴더로 복사
```

#### 4. Dictionary 인스턴스 불러오기

```swift
	// 1~3 과정을 통해 Data가 있는게 확인이 되면 진행되는 부분
	
	if let dict = NSDictionary(contentsOfFile: basePath) as? [String:AnyObject] {
		//use swift dictionary as normal
	}

	//document 폴더에 있는 파일을 NSDictionary를 통해서 Dictionary 인스턴스로 불러오기
```

#### 5. write(toFile)메소드를 통해 파일 저장

```swift
	if let dict = NSDictionary(contentsOfFile: basePath) as? [String: Any] {
		var loadData = dict
		loadData.updateValue("addData", forKey: "key")
		
		let nsDic:NSDictionary = NSDictionary(dictionary: loadData)
		nsDic.write(toFile: basePath, atomically: true)
	}
	
	//dictionary를 수정, NSDictionary로 변경 후 writeToFole 메소드를 통해 파일에 저장
```

###### Plist File in Document

```swift
//1. Document folder path 찾기
//2. Document folder에 plist 파일이 있는지 확인
//		- 만약 없다면: bundle에 있는 파일을 Document에 복사
//3. path를 통해 객체로 변환, 데이터 불러오기
//4. writeToFile 메소드로 파일 저장
```

###### 연습!

```swift
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
        
        //Singleton pattern을 사용한다면 이렇게도 사용 가능.
        //FriendData.standard.set("Ed" as AnyObject, forKey: "ff")
        //FriendData.standard.object(forKey: "dd")
        
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    //bundle
	func bundle() {    
//    let bundle = Bundle.main
//    let path = bundle.path(forResource: "FriendList", ofType: "plist")
        
        
	//    if let realPath = path {
	//            
	//        // Any 안됨!
	//        let dict = NSDictionary(contentsOfFile: realPath) as? [String:AnyObject]
	//            
	//        // optional binding
	//        if let realDic = dict {
	//                
	//        }
	//            
	//    } else {
	//        // no files야
	//    }

        
        // 위에꺼 너무 길어서 이렇게!
	    if let realPath = Bundle.main.path(forResource: "FriendList", ofType: "plist"),
	        let dict = NSDictionary(contentsOfFile: realPath) as? [String:AnyObject] {
	            
	            print(dict["list"])
	            
	        } else {
	            // no files야
	        }
	    }
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
```

<br>

- Singleton Pattern 이용하기

```swift
//
//  FriendData.swift
//  PlistDataSample
//
//  Created by CLEE on 19/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import Foundation

class FriendData {
    private let fileName = "FriendData"
    private let fileType = "plist"
    
    private static let instance:FriendData = FriendData()
    private var friendData:[String:AnyObject]?
    
    //싱글톤 인스턴스
    class var standard: FriendData {
        return instance
    }
    
    
    func object(forKey defaultName:String) -> AnyObject? {
        guard let data = friendData else {
            return nil
        }
        return data[defaultName]
    }
    
    
    func set(_ value: AnyObject?, forKey defaultName: String) {
        guard let _ = friendData, let vvvv = value else {
            return
        }
        
        friendData![defaultName] = vvvv
    }
    
    
    func removeObject(forKey defaultName:String) {
        guard let _ = friendData else {
            return
        }
        friendData!.removeValue(forKey: defaultName)
    }
    
    
    func friendDataSave() {
        save()
    }
    
    
    private init() {
        load()
    }
    
    deinit {
        save()

    }
    
    
    //load
    private func load() {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let realPath = path[0] + "/FriendList.plist"
        
        friendData = NSDictionary(contentsOfFile: realPath) as? [String:AnyObject]
    }
    
    
    //save
    private func save() {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let realPath = path[0] + "/FriendList.plist"
        
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: realPath) {
            if let bundlePath = Bundle.main.path(forResource: fileName, ofType: fileType) {
                do {
                    try fileManager.copyItem(atPath: bundlePath, toPath: realPath)
                } catch {
                    return
                }
            }
        }
    }
}
```

## Any? AnyObject?
- Any는 인스턴스만 가능하나 AnyObject는 인스턴스와 객체 모두 가능하다.
- swift3 부터 Any를 사용해서 plist에서 값을 불러올 수 있다. 
	- Any를 사용하도록 한다. 