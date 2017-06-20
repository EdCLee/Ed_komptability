//
//  SettingViewController.swift
//  SettingSample
//
//  Created by CLEE on 20/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SettingSwitchCellDelegate {

//MARK: LIFE CYCLE//////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let v = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 100)
//        tableView.tableHeaderView = v
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
//MARK: UITableViewDataSource///////////
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingCenter.sharedSetting.sectionCount
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingCenter.sharedSetting.rowCountFor(section)
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SettingCenter.sharedSetting.title(for: section)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = SettingCenter.sharedSetting.typeOfCellFor(rowAt: indexPath)
        
        switch cellType {
        case .Basic:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath)
            cell.textLabel?.text = SettingCenter.sharedSetting.titleFor(rowAt: indexPath)
            cell.detailTextLabel?.text = ""
            cell.selectionStyle = .none
            return cell
        case .Detail:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath)
            cell.textLabel?.text = SettingCenter.sharedSetting.titleFor(rowAt: indexPath)
            cell.selectionStyle = .gray
            return cell
        case .Switch:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath) as! SettingSwitchCell
            cell.setTitle(SettingCenter.sharedSetting.titleFor(rowAt: indexPath))
            cell.selectionStyle = .none
            cell.delegate = self
            return cell
        case .BlueButton:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath)
            cell.textLabel?.text = SettingCenter.sharedSetting.titleFor(rowAt: indexPath)
            cell.selectionStyle = .gray
            return cell
        case .RedButton:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath)
            cell.textLabel?.text = SettingCenter.sharedSetting.titleFor(rowAt: indexPath)
            cell.selectionStyle = .gray
            return cell
        }
        
    }
    
//    func table func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//    }
    

//MARK: SETTING SWITCH CELL DELEGATE////
    
    func cellValueChanged(_ cell:SettingSwitchCell, isOn:Bool) {
        print("cellValueChanged: \(isOn)")
    }
}







//MARK: NOTE--
//
