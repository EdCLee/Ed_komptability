//
//  MainTableViewController.swift
//  PairProgrammingSettingView
//
//  Created by 박종찬 on 2017. 6. 20..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var dataArray: [SectionData]!
    var isMainArray: Bool = false
    var computedArray: [SectionData] {
        return SettingData().mainArray
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if dataArray == nil {
            dataArray = computedArray
            isMainArray = true
        }
        
        if self.title == nil {
            self.title = "설정"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isMainArray {
            dataArray = computedArray
        } else if self.title == "셀룰러" {
            
            dataArray = SettingData().cellularArray
            
        }
        self.tableView.reloadData()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return dataArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray[section].cellData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellData: CellData = dataArray[indexPath.section].cellData[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellData.type.rawValue, for: indexPath)
        
        cell.textLabel?.text = cellData.title
        cell.detailTextLabel?.text = cellData.detailString ?? ""
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataArray[section].title ?? ""
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let key = tableView.cellForRow(at: indexPath)?.textLabel?.text
        if let dataArray = SettingData().navigationDictionary[key!] {
            let vc: MainTableViewController = self.storyboard?.instantiateViewController(withIdentifier: "TableViewForSetting") as! MainTableViewController
            vc.title = key
            vc.dataArray = dataArray
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
