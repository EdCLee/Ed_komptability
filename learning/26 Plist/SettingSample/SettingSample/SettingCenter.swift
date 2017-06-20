//
//  SettingCenter.swift
//  SettingSample
//
//  Created by CLEE on 20/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import Foundation

enum SettingCellType:String {
    // 키값으로 cell id를 지정해준다.
    case Basic = "SettingBasicCell"
    case Detail = "SettingDetailCell"
    case Switch = "SettingSwitchCell"
    case BlueButton = "SettingBlueButtonCell"
    case RedButton = "SettingRedButtonCell"
}

class SettingCenter {
    
    var settingMenuDataList:[Any]?
    
    // singleton
    static let sharedSetting:SettingCenter = SettingCenter()
    
    private init() {
        loadSettingData()
    }

    // section 갯수 가져오기 {get}
    var sectionCount:Int{
        return settingMenuDataList?.count ?? 0
    }
    
    
    // section의 타이틀 가져오기 {get}
    func title(for section:Int) -> String {
     
        guard let sectionDatas = settingMenuDataList else {
            return "no name for section"
        }
    
        let dic:[String:Any] = sectionDatas[section] as! [String:Any]
        let sectionTitle = dic["SectionTitle"] as? String
        
        return sectionTitle ?? "no name for section"
    }
    
    
    func rowCountFor(_ section:Int) -> Int {
        
        guard let sectionDatas = settingMenuDataList else {
            return 0
        }
        let sectionData:[String:Any] = sectionDatas[section] as! [String:Any]
        
        if let rowDataList = sectionData["Data"] as? [Any] {
            return rowDataList.count
        }else {
            return 0
        }
    }
    
    
    // cell 타이틀 가져오기 {get}
    func titleFor(rowAt indexPath:IndexPath) -> String {
        
        //settingMenuDataList에서 각 로우의 타이틀 가져오기
        guard let sectionDatas = settingMenuDataList else {
            return "no name for cell"
        }
        //dictionary 타입으로 값을 담는다. 2개의 key가 있음 SectionTitle, Data
        let sectionData:[String:Any] = sectionDatas[indexPath.section] as! [String:Any]
        
        // 2개의 key 중 Data를 가져오는데 Array로 되어있으므로 [Array]에 담는다.
        let rowDataList = sectionData["Data"] as? [Any]
        
        // Data 안에는 CellStyle과 Content의 2개의 키가 있음. String타입으로 되어있으므로 String
        let rowData = rowDataList?[indexPath.row] as? [String:Any]

        let title = rowData?["Content"] as? String
        
        return title ?? "no name for cell"
        
    }
    
    
    // cell 타입 가져오기 {get}, 리턴 타입인 String을 열거형 타입으로 변경해야 함
    func typeOfCellFor(rowAt indexPath:IndexPath) -> SettingCellType {
        
        //settingMenuDataList에서 각 셀의 타입 가져오기
        guard let sectionDatas = settingMenuDataList else {
            return .Basic
        }
        
        let sectionData:[String:Any] = sectionDatas[indexPath.section] as! [String:Any]
        //sectionData: 2개의 key "SectionTitle", "Data"
        let rowDataList = sectionData["Data"] as? [Any]
        let rowData = rowDataList?[indexPath.row] as? [String:Any]
        //rowData: keys = "CellStyle", "Content"
        
        let styleStr = rowData?["CellStyle"] as! String
        let cellStyle:SettingCellType? = SettingCellType(rawValue: styleStr)
        return cellStyle ?? .Basic
        
        //예외처리
//        if let styleStr = rowData?["CellStyle"] as? String {
//            let cellStyle:SettingCellType? = SettingCellType(rawValue: styleStr)
//            return cellStyle ?? .Basic
//        }else {
//            return .Basic
//        }
    }
    
    
    
    // "Settings.plist" 에서 데이터 불러오기
    func loadSettingData() {
        if let path = Bundle.main.path(forResource: "Settings", ofType: "plist"),
            let settingMenuDataList = NSArray(contentsOfFile: path) as? [Any] {
            
            self.settingMenuDataList = settingMenuDataList
        }
    }
    
}
