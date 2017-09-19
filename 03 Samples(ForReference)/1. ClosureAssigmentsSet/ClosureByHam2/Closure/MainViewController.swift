//
//  ViewController.swift
//  Closure
//
//  Created by youngmin joo on 2017. 6. 21..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var friendList: [Person] = []
    var segmentItems: [Int] = []
    var originalItems: [Int] {
        
        let dataList = DataFile.instance.friendList
        var tempArray: [Int] = []
        for i in 0...dataList.count - 1 {
            tempArray.append(i)
        }
        return tempArray
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if segmentControl.selectedSegmentIndex == 0 {
            loadData()
            tableView.reloadData()
        }
        if segmentControl.selectedSegmentIndex == 1 {
            manSelected()
        }
        if segmentControl.selectedSegmentIndex == 2 {
            womanSelected()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = friendList[indexPath.row].name
        cell.detailTextLabel?.text = String(friendList[indexPath.row].age)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination: DetailViewController = segue.destination as! DetailViewController
        
        if segue.identifier == "EditSegue" {
            
            let cell = sender as! UITableViewCell
            
            guard let indexPath = tableView.indexPath(for: cell) else {
                return print("인덱스 패스 없음")
            }
            
            let row = friendList[indexPath.row]
            
            destination.editingMode = true
            destination.name = row.name
            destination.age = String(row.age)
            destination.gender = row.gender.rawValue
            destination.indexRow = indexPath.row
            
            if segmentItems.isEmpty {
                destination.originalPositions = originalItems
            } else {
                destination.originalPositions = segmentItems
            }
        }
    }
    
   
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            loadData()
            tableView.reloadData()
        }
        if sender.selectedSegmentIndex == 1 {
            manSelected()
        }
        if sender.selectedSegmentIndex == 2 {
            womanSelected()
        }
    }
    

    func manSelected() {
        
        loadData()
        var tempList: [Person] = []
        var tempNum: Int = 0
        
        for index in friendList {
            
            if index.gender.rawValue == "Man" {
                tempList.append(index)
                segmentItems.append(tempNum)
            }
            tempNum += 1
        }
        friendList = tempList
        tableView.reloadData()
    }
    
    func womanSelected() {
        
        loadData()
        var tempList: [Person] = []
        var tempNum: Int = 0
        
        for index in friendList {
            
            if index.gender.rawValue == "Woman" {
                tempList.append(index)
                segmentItems.append(tempNum)
            }
            tempNum += 1
        }
        friendList = tempList
        tableView.reloadData()
    }
    
    
    func loadData() {
        
        friendList = DataFile.instance.friendList
        segmentItems = []
    }
    
}

