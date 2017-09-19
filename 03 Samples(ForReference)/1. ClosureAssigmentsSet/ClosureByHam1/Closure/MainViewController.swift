//
//  ViewController.swift
//  Closure
//
//  Created by youngmin joo on 2017. 6. 21..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITextFieldDelegate {
    
    var userList: [[String: String]] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        var userData = userList[indexPath.row]
        
        cell.textLabel?.text = userData["Name"]
        cell.detailTextLabel?.text = userData["Age"]
        
        return cell
    }
    
    func loadData() {
        
        guard let container: [[String: Any]] = UserDefaults.standard.array(forKey: "Users") as? [[String : Any]] else {
            return print("데이터가 넘어오지 않았음!")
        }
        
        userList = container as! [[String : String]]
    }
    
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            
            loadData()
            tableView.reloadData()
        }
        
        if sender.selectedSegmentIndex == 1 {
            
            loadData()
            
            let container = userList.filter({ (men: [String : String]) -> Bool in
                
                return men["Gender"] == "남"
            })
            
            userList = container
            tableView.reloadData()
        }
        
        if sender.selectedSegmentIndex == 2 {
            
            loadData()
            
            let container = userList.filter({ (men: [String : String]) -> Bool in
                
                return men["Gender"] == "여"
            })
            
            userList = container
            tableView.reloadData()
        }
        
    }
    
}

