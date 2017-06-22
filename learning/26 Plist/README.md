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
                		print("non defined error case")
                    return
                }
            }
            print("bundle has no data")
            return
        }
        //write
        if let userDict = NSDictionary(contentsOfFile: realPath) as? [String:Any] {
            
            var loadData = userDict
            loadData.updateValue("addData", forKey: "key")
            
            let nsDict:NSDictionary = NSDictionary(dictionary: loadData)
            nsDict.write(toFile: realPath, atomically: true)
        }
    }
}
```

<br>

- appDelegate.swift

```swift
    func applicationDidEnterBackground(_ application: UIApplication) {
        
        //Background에 들어갈때 저장.
        UserDataSet.standard.save()
    
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
        //Terminate 될때 저장.
        UserDataSet.standard.save()

    }
```

## Any? AnyObject?
- Any는 인스턴스만 가능하나 AnyObject는 인스턴스와 객체 모두 가능하다.
- swift3 부터 Any를 사용해서 plist에서 값을 불러올 수 있다. 
	- Any를 사용하도록 한다. 

<br>
<br>
<br>

---

## DatePicker / DateFormatter

```swift
@IBAction func datePickerMain(_ sender: UIDatePicker) {
    let myDateFormat = DateFormatter()
    myDateFormat.dateFormat = "yyyy년 MM월 dd일 a h시 mm분"
        
    labelDateStatus.text = "\(myDateFormat.string(from: sender.date))"   
}
```

## Array 안에 있는 Dictionary 데이터를 가져오기
 - `FriendData`라는 싱글턴을 만들고, 관리한다.
 - `For`문을 돌면서 익셔너리의 값을 가져온다.

```swift
let data = FriendData.standard.object(forKey: "list") as! [Any]

for person in data {
	let personDic = person as! [String:Any]
	let name = personDic["name"] as! String
	let age = personDic["age"] as! Int
}
```

## UITableView의 헤더뷰
 - 테이블 뷰의 위에 View 하나를 얹이면, 테이블 뷰의 헤더뷰가 된다.

---

# [ Mini Project ] 앱 세팅 화면 만들기
> 전체 소스는 프로젝트 폴더를 참고해주세요. - [프로젝트 폴더 바로가기](https://github.com/blackturtle2/Leejaesung_iOS_School/tree/master/Projects/Practice0620_BrandNewSettingApp/Practice0620_BrandNewSettingApp)

## 요구사항 - `UITableView`를 이용해 뷰를 구성한다.
 - `Plist`를 이용해 UI 구성을 위한 데이터를 설계하고, 활용한다.
 - `enum`으로 Cell을 구분한다.
 - `Singleton` 패턴을 활용해, `Plist`로부터 데이터를 가져와서 테이블 뷰의 UI를 구성한다.## 결과 미리보기
![SettingApp.png](SettingApp.png)## UI 그리기
 - UI는 내비게이션 컨트롤러를 임베디드하고, 테이블 뷰를 넣은 뷰컨트롤러를 만든다.
 - 테이블 뷰에 프로토타입 셀을 3가지 넣고, `Identifier`로 구분한다.
 - ~UI는 늘 하던대로.. 잘.. 열심히..~

## `Plist`
 - Plist에는 `Array > Dictionary > String, Array > Dictionary` 구조로 이루어져 있다.

![SettingAppPlist.png](SettingAppPlist.png)

## `SettingCenter`
 - 데이터 모델링을 위한 `SettingCenter`을 구현한다.

### `enum`
 - `Cell` 구분을 위한 타입을 나눈다.
 - `enum`도 `SettingCenter`에서 정의한다.

```swift
enum SettingCellType:String {
    case Basic = "SettingBasicCell"
    case Detail = "SettingDetailCell"
    case Switch = "SettingSwitchCell"
    case BlueButton = "SettingBlueButtonCell"
    case RedButton = "SettingRedButtonCell"
}
```

### class `SettingCenter`
 - `Singleton` 패턴을 위해 상단에 `sharedSetting`을 선언하고, 초기화한다.
	 - `static let sharedSetting:SettingCenter = SettingCenter()`
	 - 다른 클래스에서 이 Singleton 사용을 위해서는 `SettingCenter.sharedSetting.~`을 활용한다.
	 - 예시: `SettingCenter.sharedSetting.titleFor(rowAtIndexPath: indexPath)`
	 - 싱글턴은 **천상천하 유아독존 나만 존재하겠다..!!!** ~( 혹시 읽으시는 분들께 죄송합니다.. (_ _) )~
 - `Plist` 설계를 참고하여, 필요하다고 생각되는 것들을 함수로 만들고, 후에 테이블 뷰를 그리면서 필요할 때, 만들어도 된다.
 - `Plist` 에서 데이터를 가져오기 위해 `init()`에서 `loadData()`를 호출하고, `loadData()`를 정의한다.
```swift
class SettingCenter {
    
    // Singleton.
    static let sharedSetting:SettingCenter = SettingCenter()
    
    var settingMenuDataList:[Any]?
    
    // section의 갯수 리턴.
    var sectionCount:Int {
        return settingMenuDataList?.count ?? 0
    }
    
    // section별 Row 갯수 리턴.
    func numberOfRows(in section:Int) -> Int {
        guard let sectionData = settingMenuDataList else {  return 1 }
        
        let dicSectionData:[String:Any] = sectionData[section] as! [String:Any]
        let arrayRowTitle = dicSectionData["Data"] as! [[String:String]]
        
        return arrayRowTitle.count
    }
    
    // section의 title 리턴.
    func titleFor(section:Int) -> String {
        guard let sectionData = settingMenuDataList else {  return "" }
        
        let dicSectionData:[String:Any] = sectionData[section] as! [String : Any]
        let sectionTitle = dicSectionData["SectionTitle"] as? String
        
        return sectionTitle ?? "섹션 이름 없음"
    }
    
    // row의 title 리턴.
    func titleFor(rowAtIndexPath indexPath:IndexPath) -> String {
        guard let sectionData = settingMenuDataList else {  return "" }
        
        let dicSectionData:[String:Any] = sectionData[indexPath.section] as! [String:Any]
        let arrayRowTitle = dicSectionData["Data"] as! [[String:String]]
        let rowTitle = arrayRowTitle[indexPath.row]["Content"]!
        
        return rowTitle
    }
    
    // 각 셀의 타입 가져오기.
    func typeOfCellFor(rowAtIndexPath indexPath:IndexPath) -> SettingCellType {
        guard let sectionData = settingMenuDataList else { return .Basic }
        
        let dicSectionData:[String:Any] = sectionData[indexPath.section] as! [String:Any]
        let arrayCellStyle = dicSectionData["Data"] as! [[String:String]]
        let cellStyle = arrayCellStyle[indexPath.row]["CellStyle"]
        
        return SettingCellType(rawValue: cellStyle!) ?? .Basic
    }
    
    // init()
    private init() {
        loadSettingData()
    }
    
    // Settings.plist 에서 데이터를 불러오기.
    func loadSettingData() {
        if let path = Bundle.main.path(forResource: "Settings", ofType: "plist"),
            let settingMenuDataList = NSArray(contentsOfFile: path) as? [Any] {
            
            self.settingMenuDataList = settingMenuDataList
        }
        
    }
    
}
```
#### [ Singleton 특집 ] `loadSettingData()` - 데이터 수정은 하지 않을 계획이기 때문에 `Bundle`에서 데이터를 로드하기만 하자.
 - `path` 변수에 `Bundle.main.path(forResource: "Settings", ofType: "plist")`을 넣어준다.
 - `NSArray(contentsOfFile: path)`을 이용해 번들에 값이 있다면..
 - `Singleton`에 번들로부터 가져온 값을 넣어준다.
	 - `Singleton`은 `self.settingMenuDataList`으로 호출한다.```swift
func loadSettingData() {
    if let path = Bundle.main.path(forResource: "Settings", ofType: "plist"),
        let settingMenuDataList = NSArray(contentsOfFile: path) as? [Any] {
        
        self.settingMenuDataList = settingMenuDataList
    }
    
}
```

## `SettingViewController`
 - 설정 화면의 뷰 컨트롤러 정의. ( 위에 첨부한 스크린 샷의 메인 화면 구성 )
 - 앞서 만들어둔 `Singleton`을 잘 활용하여, 테이블 뷰를 구성한다.
 - `Cell`을 그릴 때, `plist`에 저장된 `cell`의 `type`으로 구분하여, `cell`을 그려주고, 특히 `UISwitch`가 있는 `cell`은 커스텀 cell로 잘 구분해 넣도록 한다.
	 - `UISwitch`를 위한 `delegate`도 `cell`을 그릴 때, 연결하도록 한다.

```swift
case .Switch:
        let myCell = tableView.dequeueReusableCell(withIdentifier: SettingCellType.Switch.rawValue) as! SettingSwitchCell
        
        myCell.labelTitle?.text = SettingCenter.sharedSetting.titleFor(rowAtIndexPath: indexPath)
        myCell.delegate = self
```

### class `SettingViewController`
 - 테이블 뷰를 그리기 위해, `UITableViewDelegate`, `UITableViewDataSource`를 채택한다.
 - 테이블 뷰를 그리는 데에 필요한 함수들을 정의한다.
 - ~자세히 보면, `SettingCenter`에서 모두 정의한 것들을 호출만 한다.~ (...)

```swift
class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SettingSwitchCellDelegate {
    
    // ... //
    
    // MARK: ********** UITableViewDataSource **********
    func numberOfSections(in tableView: UITableView) -> Int {
        return (SettingCenter.sharedSetting.settingMenuDataList?.count)!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingCenter.sharedSetting.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SettingCenter.sharedSetting.titleFor(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellType = SettingCenter.sharedSetting.typeOfCellFor(rowAtIndexPath: indexPath)
        
        
        switch cellType {
        case .Basic:
            let myCell = tableView.dequeueReusableCell(withIdentifier: SettingCellType.Basic.rawValue)!
            
            myCell.textLabel?.text = SettingCenter.sharedSetting.titleFor(rowAtIndexPath: indexPath)
            myCell.detailTextLabel?.text = "detailTextLabel test"
            myCell.selectionStyle = .none
            
            return myCell
            
        case .Detail:
            let myCell = tableView.dequeueReusableCell(withIdentifier: SettingCellType.Detail.rawValue)!
            
            myCell.textLabel?.text = SettingCenter.sharedSetting.titleFor(rowAtIndexPath: indexPath)
            
            return myCell
            
        case .Switch:
            let myCell = tableView.dequeueReusableCell(withIdentifier: SettingCellType.Switch.rawValue) as! SettingSwitchCell
            
            myCell.labelTitle?.text = SettingCenter.sharedSetting.titleFor(rowAtIndexPath: indexPath)
            myCell.delegate = self
            
            return myCell
            
        case .BlueButton:
            let myCell = tableView.dequeueReusableCell(withIdentifier: SettingCellType.BlueButton.rawValue, for: indexPath)
            myCell.textLabel?.text = SettingCenter.sharedSetting.titleFor(rowAtIndexPath: indexPath)
            return myCell
            
        case .RedButton:
            let myCell = tableView.dequeueReusableCell(withIdentifier: SettingCellType.RedButton.rawValue, for: indexPath)
            myCell.textLabel?.text = SettingCenter.sharedSetting.titleFor(rowAtIndexPath: indexPath)
            return myCell
        }
        
    }
```

## `SettingSwitchCell`
 - `Setting` 화면에서 `UISwitch`가 있는 커스텀 Cell을 정의한다.
 - `Switch`가 있는 `cell`의 형태는 기본적으로 존재하지는 않고, 더군다나 `switch`의 `value changed`를 뷰 컨트롤러 단으로 데려오기 위해서는 `delegate`가 필요하다.

### protocol `SettingSwitchCellDelegate`
 - `SettingSwitchCell` class를 정의하기 이전에 `delegate` 연결을 위한 프로토콜을 먼저 선언한다.
 - 이때, `delegate` 함수에는 `cell`을 태우고, 이 `cell`에는 `SettingSwitchCell`라는 `class` 자기 자신을 태우도록 한다. **이 부분이 키포인트!!!**
 - 추후에 이 방법은 `cell` 자신이 뷰 컨트롤러에게 자기 자신을 던지는 데에 사용된다. ~뷰 컨트롤러님, 저의 값이 변경되었으니, 이제 컨트롤러님 하고 싶은대로 하시지요..~

```swift
protocol SettingSwitchCellDelegate {
    func cellValueChanged(_ cell:SettingSwitchCell, isOn:Bool)
}
```

### class `SettingSwitchCell`
 - `Delegate 변수`의 선언을 **절대 절대 절대** 잊지 말자!!!

```swift
class SettingSwitchCell: UITableViewCell {

    var delegate:SettingSwitchCellDelegate?
    
    // ... //
}
```

### UISwitch의 `ValueChangeAction`
 - `UISwitch`의 값이 바뀔 때마다 프로토콜에 정의된 `cellValueChanged()`를 호출하고, 매개변수 `cell`에 자기 자신을 `self`로 태워보낸다. ~( 자기 자신을 태워보내는 것이 핵핵핵포인트이다!!! )~

```swift
@IBAction func switcherValueChangeAction(_ sender: UISwitch) {
    delegate?.cellValueChanged(self, isOn: sender.isOn)
}
```

### class `SettingViewController`
 - `delegate` 연결을 위해 프로토콜, `SettingSwitchCellDelegate`을 먼저 채택한다.
 - `delegate` 함수인 `cellValueChanged()` 를 정의한다.
 - 사실은.. 아직 딱히 정의할 액션이 없어서 `delegate`가 잘 연결되었는지 확인하기 위해 `print()` 만을 해보았다. ~그리고 잘 연결되었다.~

```swift
class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SettingSwitchCellDelegate {

// ... //

// MARK: ********** SettingSwitchCellDelegate **********
func cellValueChanged(_ cell: SettingSwitchCell, isOn: Bool) {
    print("cellValueChanged \(isOn)")
}
```

<br>
<br>

###### Part of content is imported from 재성

