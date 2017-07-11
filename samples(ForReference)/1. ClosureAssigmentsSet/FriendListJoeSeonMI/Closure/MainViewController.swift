//
//  ViewController.swift
//  Closure
//
//  Created by youngmin joo on 2017. 6. 21..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    /*******************************************/
    //           Outlet & Property             //
    /*******************************************/
    
    var filterFriendList:[Person] = DataFile.sharedData.friendList
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func segumentControll(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 1 {
            let genderFilter = DataFile.sharedData.friendList.filter({ (friend:Person) -> Bool in
                friend.gender == Gender.Man
            })
            filterFriendList = genderFilter
        }
        else if sender.selectedSegmentIndex == 2 {
            let genderFilter = DataFile.sharedData.friendList.filter({ (friend:Person) -> Bool in
                friend.gender == Gender.Woman
            })
            filterFriendList = genderFilter
        }
        else if sender.selectedSegmentIndex == 0 {
            filterFriendList = DataFile.sharedData.friendList
        }
        self.tableView.reloadData()
    }
    
    
    
    /*******************************************/
    //                Life Cycle               //
    /*******************************************/
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        filterFriendList = DataFile.sharedData.friendList
        tableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*******************************************/
    //                  Table                  //
    /*******************************************/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterFriendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = filterFriendList[indexPath.row].name
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nextVC:Info = (storyboard?.instantiateViewController(withIdentifier: "Info") as? Info)!
        
        if filterFriendList[indexPath.row].gender == .Man {
            nextVC.receiveGender = "남자"
        }
         nextVC.receiveGender = "여자"

        
        nextVC.receiveName = filterFriendList[indexPath.row].name
        nextVC.receiveAge = String(filterFriendList[indexPath.row].age)
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }

}

