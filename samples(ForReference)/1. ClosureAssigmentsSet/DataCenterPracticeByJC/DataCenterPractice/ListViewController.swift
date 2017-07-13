//
//  ListViewController.swift
//  DataCenterPractice
//
//  Created by 박종찬 on 2017. 6. 30..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private var currentDataArray: [Person]!
    
    @IBOutlet weak var tableViewSourceSegmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        filterData()
        self.tableView.reloadData()
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        filterData()
        self.tableView.reloadData()
    }

    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PersonCell = tableView.dequeueReusableCell(withIdentifier: PersonCell.reuseIdentifier, for: indexPath) as! PersonCell
        
        cell.data = currentDataArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let deletingPerson = (tableView.cellForRow(at: indexPath) as! PersonCell).data!
            DataCenter.shared.remove(person: deletingPerson)
            self.filterData()
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    
    
    
    
    
    func filterData() {
        currentDataArray = DataCenter.shared.dataArray.filter({ (person) -> Bool in
            switch self.tableViewSourceSegmentedControl.selectedSegmentIndex {
            case 1:
                return person.gender == Gender.woman
            case 2:
                return person.gender == Gender.man
            default:
                return true
            }
        })
    }
}





class PersonCell: UITableViewCell {
    fileprivate static let reuseIdentifier:String = "DetailCell"
    var data: Person! {
        didSet {
            self.textLabel?.text = data.name
            self.detailTextLabel?.text = data.phoneNumber
        }
    }
    
    
}
