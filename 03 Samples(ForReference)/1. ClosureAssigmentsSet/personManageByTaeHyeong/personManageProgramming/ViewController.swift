//
//  ViewController.swift
//  personManageProgramming
//
//  Created by 김태형 on 2017. 6. 26..
//  Copyright © 2017년 김태형. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var maleData:[[String:Any]] = []
    var femaleData:[[String:Any]] = []
    
    @IBOutlet weak var genderChangeOutlet: UISegmentedControl!
    @IBOutlet weak var tv: UITableView!
    
    @IBAction func genderChangeButton(_ sender: UISegmentedControl) {
        tv.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var maleNum:Int = 0
        var femaleNum:Int = 0
        if genderChangeOutlet.selectedSegmentIndex == 0
        {
            var tempNumArray:[Int] = []
            let maleDataList = NewDataCenter.dataArray.filter({ (dataInfo) -> Bool in
                if dataInfo["gender"] as? Gender == Gender.Male
                {
                    tempNumArray.append(maleNum)
                    NewDataCenter.maleNumArray = tempNumArray
                    maleNum += 1
                    return true
                    
                }else{
                    maleNum += 1
                    return false
                }
            })
            maleData = maleDataList
            return maleData.count
        }else if genderChangeOutlet.selectedSegmentIndex == 1{
            var tempNumArray:[Int] = []
            let femaleDataList = NewDataCenter.dataArray.filter({ (dataInfo) -> Bool in
                if dataInfo["gender"] as? Gender == Gender.Female
                {
                    tempNumArray.append(femaleNum)
                    NewDataCenter.femaleNumArray = tempNumArray
                    femaleNum += 1
                    return true
                    
                }else{
                    femaleNum += 1
                    return false
                }
                
            })
            femaleData = femaleDataList
            return femaleData.count
        }else{
            return NewDataCenter.dataArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1")
        if genderChangeOutlet.selectedSegmentIndex == 0
        {
            cell?.textLabel?.text = maleData[indexPath.row]["name"] as? String
            cell?.detailTextLabel?.text = maleData[indexPath.row]["age"] as? String
            return cell!
            
        }else if genderChangeOutlet.selectedSegmentIndex == 1{

            cell?.textLabel?.text = femaleData[indexPath.row]["name"] as? String
            cell?.detailTextLabel?.text = femaleData[indexPath.row]["age"] as? String
            return cell!
        }else{
            cell?.textLabel?.text = NewDataCenter.dataArray[indexPath.row]["name"] as? String
            cell?.detailTextLabel?.text = NewDataCenter.dataArray[indexPath.row]["age"] as? String
            return cell!
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let detailViewCon = segue.destination as! DetailViewController
        switch genderChangeOutlet.selectedSegmentIndex {
        case 0:
            if segue.identifier == "cellToDetail"
            {
                let cell = sender as! UITableViewCell
                let vIndex = tv.indexPath(for: cell)
                let tempNum = NewDataCenter.maleNumArray[(vIndex?.row)!]
                
                detailViewCon.cellData = NewDataCenter.dataArray[tempNum]
                detailViewCon.addOrFix.title = "수정"
                detailViewCon.editingMode = true
                detailViewCon.dTempNum = tempNum
            }
        case 1:
            if segue.identifier == "cellToDetail"
            {
                let cell = sender as! UITableViewCell
                let vIndex = tv.indexPath(for: cell)
                let tempNum = NewDataCenter.femaleNumArray[(vIndex?.row)!]
                
                detailViewCon.cellData = NewDataCenter.dataArray[tempNum]
                detailViewCon.addOrFix.title = "수정"
                detailViewCon.editingMode = true
                detailViewCon.dTempNum = tempNum
            }
        default:
            if segue.identifier == "cellToDetail"
            {
                let cell = sender as! UITableViewCell
                let vIndex = tv.indexPath(for: cell)
                
                detailViewCon.cellData = NewDataCenter.dataArray[(vIndex?.row)!]
                detailViewCon.addOrFix.title = "수정"
                detailViewCon.editingMode = true
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tv.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

