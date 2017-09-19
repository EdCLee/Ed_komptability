//
//  Data.swift
//  PairProgrammingSettingView
//
//  Created by 박종찬 on 2017. 6. 20..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import Foundation

struct CellData {
    let title: String
    let type: CellType
    var detailString: String?
}

struct SectionData {
    let title: String?
    let cellData: [CellData]
}

enum CellType: String {
    case rightDetail = "Right Detail Cell"
    case rightDetailDisclosure = "Right Detail Disclosure Cell"
    case basicSwitch = "Switch Cell"
}

func stringFor(_ bool: Bool) -> String {
    if bool {
        return "켬"
    } else {
        return "끔"
    }
}

struct SettingData {
    
    var mainArray: [SectionData] {
        
        return [SectionData(title: nil, cellData: [CellData(title: "에어플레인 모드", type: .basicSwitch, detailString: nil),
                                                           CellData(title: "Wi-Fi", type: .rightDetailDisclosure, detailString: stringFor(UserDefaults.standard.bool(forKey: "Wi-Fi"))),
                                                           CellData(title: "Bluetooth", type: .rightDetailDisclosure, detailString: stringFor(UserDefaults.standard.bool(forKey: "Bluetooth"))),
                                                           CellData(title: "셀룰러", type: .rightDetailDisclosure, detailString: nil),
                                                           CellData(title: "개인용 핫스팟", type: .rightDetailDisclosure, detailString: stringFor(UserDefaults.standard.bool(forKey: "개인용 핫스팟"))),
                                                           CellData(title: "네트워크 사업자", type: .rightDetailDisclosure, detailString: "KT")])] }
    
    var wifiArray: [SectionData] { return [SectionData(title: nil, cellData: [CellData(title: "Wi-Fi", type: .basicSwitch, detailString:nil)])] }
    
    var blttArray: [SectionData] { return [SectionData(title: nil, cellData: [CellData(title: "Bluetooth", type: .basicSwitch, detailString:nil)])] }
    
    var cellularArray: [SectionData] { return [SectionData(title: nil, cellData: [CellData(title: "셀룰러 데이터", type: .basicSwitch, detailString: nil),
                                                                           CellData(title: "셀룰러 데이터 옵션", type: .rightDetailDisclosure, detailString: "로밍 끔")]),
                                        SectionData(title: nil, cellData: [CellData(title: "개인용 핫스팟", type: .rightDetailDisclosure, detailString: stringFor(UserDefaults.standard.bool(forKey: "개인용 핫스팟")))]),
                                        SectionData(title: "통화 시간", cellData: [CellData(title: "현재 사용량", type: .rightDetail, detailString: "1일 10시간"), CellData(title: "누적 사용량", type: .rightDetail, detailString: "12일 10시간")]),
                                        SectionData(title: "셀룰러 데이터 사용량", cellData: [CellData(title: "현재 사용량", type: .rightDetail, detailString: "70.5GB"), CellData(title: "현재 로밍 사용량", type: .rightDetail, detailString: "0바이트")])]
    }
    
    var hotSpotArray: [SectionData] { return [SectionData(title: nil, cellData: [CellData(title: "개인용 핫스팟", type: .basicSwitch, detailString: nil)]), SectionData(title: nil, cellData: [CellData(title: "Wi-Fi 암호", type: .rightDetailDisclosure, detailString: "hil4uh53iu5")])] }
    
    var networkProviderArray: [SectionData] { return [SectionData(title: "네트워크 사업자", cellData: [CellData(title: "자동", type: .basicSwitch, detailString: nil)])]}
    
    var navigationDictionary: [String:[SectionData]] {
        get {
            return ["Wi-Fi":wifiArray, "Bluetooth": blttArray, "셀룰러":cellularArray, "개인용 핫스팟" : hotSpotArray, "네트워크 사업자" : networkProviderArray]
        }
    }
    
}
