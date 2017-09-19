//
//  ViewController.swift
//  Closure
//
//  Created by youngmin joo on 2017. 6. 21..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var manList:[Person] = []
    var womanList:[Person] = []
    
    @IBOutlet weak var tableVIew: UITableView!
    
    @IBOutlet weak var sexSegmented: UISegmentedControl!
    
    @IBAction func segmentedAction(_ sender: UISegmentedControl) {
        tableVIew.reloadData()
    }
    
    @IBAction func moveToAdd(_ sender: Any) {
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //Datafile.friendList에 detail에서 추가한 친구 append하는 noti func
    func callNoti(sender:Notification) {
        DataFile.friendList.append(sender.object as! Person)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //noti observer로 보내기
        NotificationCenter.default.addObserver(DataFile.friendList, selector: #selector(MainViewController.callNoti(sender:)), name: Notification.Name(rawValue: "friendInfo"), object: nil)
        
        tableVIew.reloadData()
        
        manList = (DataFile.friendList.filter{ (person: Person) -> Bool in
            return person.gender == Gender.Man
        })
        
        womanList = (DataFile.friendList.filter{ (person: Person) -> Bool in
            return person.gender == Gender.Woman
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //segue destination? noti?
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addSegue" {
            let detailViewController:DetailViewController = segue.destination as! DetailViewController
        }
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch sexSegmented.selectedSegmentIndex {
        case 0:
            return DataFile.friendList.count
        case 1:
            return manList.count 
        case 2:
            return womanList.count
        default:
            return 1
        }

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "hello"
        switch sexSegmented.selectedSegmentIndex {
        case 0:
            cell.textLabel?.text = (DataFile.friendList)[indexPath.row].name
            cell.detailTextLabel?.text = "\((DataFile.friendList)[indexPath.row].age)살"
        case 1:
            cell.textLabel?.text = (manList)[indexPath.row].name
            cell.detailTextLabel?.text = "\((manList)[indexPath.row].age)살"
        case 2:
            cell.textLabel?.text = (womanList)[indexPath.row].name
            cell.detailTextLabel?.text = "\((womanList)[indexPath.row].age)살"
        default : break
        }

        return cell
    }
    
}

