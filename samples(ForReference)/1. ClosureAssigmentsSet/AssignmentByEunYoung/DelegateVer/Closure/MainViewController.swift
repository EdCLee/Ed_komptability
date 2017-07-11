//
//  ViewController.swift
//  Closure
//
//  Created by youngmin joo on 2017. 6. 21..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let dataFile:DataFile = DataFile()
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
    
    override func viewWillAppear(_ animated: Bool) {
        tableVIew.reloadData()
        
        manList = (dataFile.friendList.filter{ (person: Person) -> Bool in
            return person.gender == Gender.Man
        })
        
        womanList = (dataFile.friendList.filter{ (person: Person) -> Bool in
            return person.gender == Gender.Woman
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //segue destination으로 delegate보내주기.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue" {
            let detailVC:DetailViewController = segue.destination as! DetailViewController
            detailVC.personDelegate = dataFile
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch sexSegmented.selectedSegmentIndex {
        case 0:
            return dataFile.friendList.count
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
            cell.textLabel?.text = (dataFile.friendList)[indexPath.row].name
            cell.detailTextLabel?.text = "\((dataFile.friendList)[indexPath.row].age)살"
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

